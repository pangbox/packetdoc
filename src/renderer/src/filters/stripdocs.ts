export default function stripdocs(data: any): any {
  if (Array.isArray(data)) {
    return data.map(stripdocs);
  } else if (data instanceof Map) {
    const newData = new Map<any, any>();
    for (const [key, value] of data.entries()) {
      if (key == "doc") {
        continue;
      }
      newData.set(key, stripdocs(value));
    }
    return newData;
  } else if (typeof data === "object") {
    data = Object.assign({}, data);
    for (const key in data) {
      if (!data.hasOwnProperty(key) || key === "doc") {
        continue;
      }
      data[key] = stripdocs(data[key]);
    }
  }
  return data;
}
