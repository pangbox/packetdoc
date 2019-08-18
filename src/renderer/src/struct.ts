import YAML from "yaml";
import path from "path";

class KaitaiCase {
  parent: KaitaiSwitch;
  rawValue: number | string;
  rawKey: string;

  constructor(parent: KaitaiSwitch, rawValue: number | string, rawKey: string) {
    this.parent = parent;
    this.rawValue = rawValue;
    this.rawKey = rawKey;
  }

  get value(): number | null {
    if (typeof this.rawValue === "number") {
      return this.rawValue;
    }

    const enumValue = this.file.enumValues.get(this.rawValue);
    if (enumValue) {
      return enumValue.value;
    }

    return null;
  }

  get type(): KaitaiStruct | null {
    const typeName = this.rawKey.split("(")[0];
    return this.file.typeMap.get(typeName) || null;
  }

  get file(): KaitaiStructFile {
    return this.parent.parent.parent.parent;
  }
}

class KaitaiSwitch {
  parent: KaitaiField;
  switchOn: string;
  cases: KaitaiCase[] = [];

  constructor(parent: KaitaiField, raw: Map<any, any>) {
    this.parent = parent;
    this.switchOn = raw.get("switch-on");
    for (const [value, key] of raw.get("cases").entries()) {
      this.cases.push(new KaitaiCase(this, value, key));
    }
  }

  get file(): KaitaiStructFile {
    return this.parent.parent.parent;
  }
}

class KaitaiField {
  parent: KaitaiStruct;
  id: string;
  type?: string;
  doc?: string;
  switch: KaitaiSwitch | null = null;

  constructor(parent: KaitaiStruct, raw: Map<any, any>) {
    this.parent = parent;
    this.id = raw.get("id");
    this.doc = raw.get("doc");
    this.parseType(raw.get("type"));
  }

  get file(): KaitaiStructFile {
    return this.parent.parent;
  }

  get struct(): KaitaiStruct | null {
    return (this.type && this.file.typeMap.get(this.type)) || null;
  }

  private parseType(raw: any) {
    if (typeof raw === "string") {
      this.type = raw;
    } else if (raw instanceof Map) {
      this.type = "switch";
      this.switch = new KaitaiSwitch(this, raw);
    }
  }
}

export class KaitaiStruct {
  parent: KaitaiStructFile;
  id: string = "";
  title?: string;
  doc?: string;
  fields: KaitaiField[] = [];

  constructor(parent: KaitaiStructFile) {
    this.parent = parent;
  }

  static fromRootType(parent: KaitaiStructFile, raw: Map<any, any>) {
    const self = new KaitaiStruct(parent);
    const meta = raw.get("meta");
    self.id = meta.get("id");
    self.title = meta.get("title");
    self.doc = raw.get("doc");
    self.parseFields(raw.get("seq") || []);
    return self;
  }

  static fromSubType(parent: KaitaiStructFile, id: string, raw: Map<any, any>) {
    const self = new KaitaiStruct(parent);
    self.id = id;
    self.doc = raw.get("doc");
    self.parseFields(raw.get("seq") || []);
    return self;
  }

  parseFields(rawFields: Map<any, any>[]) {
    for (const raw of rawFields) {
      this.fields.push(new KaitaiField(this, raw));
    }
  }

  get file(): KaitaiStructFile {
    return this.parent;
  }
}

export class KaitaiEnumValue {
  parent: KaitaiEnum;
  id: string;
  value: number;

  constructor(enumeration: KaitaiEnum, id: string, value: number) {
    this.parent = enumeration;
    this.id = id;
    this.value = value;
  }

  get fullname() {
    return `${this.parent.id}::${this.id}`;
  }

  get file(): KaitaiStructFile {
    return this.parent.parent;
  }
}

export class KaitaiEnum {
  parent: KaitaiStructFile;
  id: string;
  values: KaitaiEnumValue[] = [];

  constructor(
    parent: KaitaiStructFile,
    id: string,
    valueMap: Map<number, string>
  ) {
    this.parent = parent;
    this.id = id;

    for (const [value, key] of valueMap) {
      this.values.push(new KaitaiEnumValue(this, key, value));
    }
  }

  get file(): KaitaiStructFile {
    return this.parent;
  }
}

export class KaitaiStructFile {
  filename: string;

  raw: Map<any, any>;
  root: KaitaiStruct;
  imports: KaitaiStructFile[] = [];

  enums: KaitaiEnum[] = [];
  enumValues = new Map<string, KaitaiEnumValue>();

  types: KaitaiStruct[] = [];
  typeMap = new Map<string, KaitaiStruct>();

  constructor(filename: string, code: string) {
    this.filename = filename;
    this.raw = YAML.parse(code, { mapAsMap: true } as YAML.ParseOptions);
    this.root = KaitaiStruct.fromRootType(this, this.raw);

    this.addStruct(this.root);

    if (this.raw.has("types")) {
      for (const [id, raw] of this.raw.get("types")) {
        this.addStruct(KaitaiStruct.fromSubType(this, id, raw));
      }
    }

    if (this.raw.has("enums")) {
      for (const [id, valueMap] of this.raw.get("enums")) {
        this.addEnum(new KaitaiEnum(this, id, valueMap));
      }
    }
  }

  loadImports(load: (filename: string) => string, addTypes: boolean = true) {
    if (this.raw.has("meta") && this.raw.get("meta").has("imports")) {
      for (const importName of this.raw.get("meta").get("imports")) {
        const importFilename = this.importToFullPath(importName);
        const importCode = load(importFilename);
        const importFile = new KaitaiStructFile(importFilename, importCode);
        importFile.loadImports(load, false);
        this.imports.push(importFile);
        if (addTypes) {
          this.addImportedTypes(importFile);
        }
      }
    }
  }

  addStruct(struct: KaitaiStruct) {
    if (struct.id === "padding") {
      throw new Error("Tracer");
    }
    this.types.push(struct);
    this.typeMap.set(struct.id, struct);
  }

  addEnum(enumeration: KaitaiEnum) {
    this.enums.push(enumeration);
    for (const value of enumeration.values) {
      this.enumValues.set(value.fullname, value);
    }
  }

  dependencyForImport(importName: string) {
    // TODO(jchw): Maybe implement KS_PATH resolution?
    return "./" + importName + ".ksy";
  }

  importToFullPath(importName: string) {
    return path.resolve(
      path.dirname(this.filename),
      this.dependencyForImport(importName)
    );
  }

  addImportedTypes(importFile: KaitaiStructFile) {
    importFile.imports.forEach(file => this.addImportedTypes(file));
    importFile.types.forEach(struct => this.addStruct(struct));
    importFile.enums.forEach(enumeration => this.addEnum(enumeration));
  }

  get localEnums(): KaitaiEnum[] {
    return this.enums.filter(enumeration => enumeration.parent === this);
  }

  get localTypes(): KaitaiStruct[] {
    return this.types.filter(
      type => type.parent === this && type !== this.root
    );
  }
}
