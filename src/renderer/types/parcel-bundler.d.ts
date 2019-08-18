declare module "parcel-bundler/lib/Resolver" {
  class Resolver {
    constructor(options: {});
  }

  export = Resolver;
}

declare module "parcel-bundler/lib/Asset" {
  import Resolver from "parcel-bundler/lib/Resolver";

  class Asset {
    id: string | null;
    name: string;
    basename: string;
    relativeName: string;
    options: any;
    encoding: string;
    type: string;
    hmrPageReload: boolean;
    processed: boolean;
    contents: string | null;
    ast: any;
    generated: any;
    hash: string | null;
    sourceMaps: any;
    parentDeps: Set<any>;
    dependencies: Map<any, any>;
    depAssets: Map<any, any>;
    parentBundle: any;
    bundles: Set<any>;
    cacheData: any;
    startTime: number;
    endTime: number;
    buildTime: number;
    bundledSize: number;
    resolver: Resolver;
    package: any;

    constructor(name: string, options: any);
    shouldInvalidate(): boolean;
    loadIfNeeded(): Promise<void>;
    parseIfNeeded(): Promise<void>;
    getDependencies(): Promise<void>;
    addDependency(name: string, opts?: any): void;
    resolveDependency(
      url: string,
      from?: string
    ): { depName: string; resolved: string };
    addURLDependency(url: string, opts?: any): string;
    addURLDependency(url: string, from?: string, opts?: any): string;
    getPackage(): Promise<any>;
    getConfig(filenames: string[], opts?: any): Promise<any>;
    mightHaveDependencies(): boolean;
    load(): Promise<string>;
    parse(code: string): Promise<any>;
    collectDependencies(): void;
    pretransform(): Promise<void>;
    transform(): Promise<void>;
    generate(): Promise<any>;
    process(): Promise<any>;
    postProcess(): Promise<any>;
    generateHash(): string;
    invalidate(): void;
    invalidateBundle(): void;
    generateBundleName(): string;
    replaceBundleNames(bundleNameMap: any): void;
    generateErrorMessage(err: any): any;
  }

  export = Asset;
}
