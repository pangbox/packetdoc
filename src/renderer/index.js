module.exports = bundler => {
  bundler.addAssetType('ksy', require.resolve("./KaitaiStructAsset"));
};
