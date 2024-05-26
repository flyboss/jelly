# 测试 backbone knockback
原始版本

# 测试其他 8个
```js
// files.ts
// const inNodeModules = options.library || path.includes("node_modules");
const inNodeModules = false;
if (stat.isDirectory()) {
  const base = basename(path);
  logger.debug(base);
  // if (!sub ||
  //     !(["node_modules", ".git", ".yarn"].includes(base) ||
  //         (!inNodeModules && ["out", "build", "dist", "generated"].includes(base)))) {
  const files = readdirSync(path); // TODO: use withFileTypes and dirent.isdirectory()
  if (!sub || inNodeModules || !files.includes("package.json"))
    for (const file of files.map(f => resolve(path, f)).sort((f1, f2) => {
      // make sure files are ordered before directories
      return (lstatSync(f1).isDirectory() ? 1 : 0) - (lstatSync(f2).isDirectory() ? 1 : 0) || f1.localeCompare(f2);
    }))
      yield* expandRec(file, true, visited);
  else
    logger.info(`Skipping directory 1 ${path}`);
// } else
//     logger.info(`Skipping directory 2 ${path}`);

```