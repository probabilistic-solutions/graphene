const fs = require("fs");
const path = require("path");

const targets = [
  path.join(__dirname, "..", "priv", "static", "assets", "js", "app.js"),
  path.join(__dirname, "..", "priv", "static", "assets", "js", "storybook.js"),
];

const replacements = [
  [/this\._step\.toString\(\)/g, '(this._step ?? "1").toString()'],
  [/this\._min\.toString\(\)/g, '(this._min ?? "").toString()'],
  [/this\._max\.toString\(\)/g, '(this._max ?? "").toString()'],
  [/\.requestUpdate\(\)/g, ".requestUpdate?.()"],
];

targets.forEach((filePath) => {
  try {
    if (!fs.existsSync(filePath)) return;
    let contents = fs.readFileSync(filePath, "utf8");
    let patched = contents;
    replacements.forEach(([pattern, replacement]) => {
      patched = patched.replace(pattern, replacement);
    });
    if (patched !== contents) {
      fs.writeFileSync(filePath, patched);
    }
  } catch (_error) {
    // best-effort patch
  }
});
