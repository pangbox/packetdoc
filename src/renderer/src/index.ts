import ParcelBundler from "parcel-bundler";

module.exports = (bundler: ParcelBundler) => {
  bundler.addAssetType("ksy", require.resolve("./ksyasset"));
  bundler.addAssetType("md", require.resolve("./mdasset"));
};
