const esbuild = require("esbuild");
const fs = require("fs/promises");
const path = require("path");

const args = process.argv.slice(2);
const getArgValue = (key, defaultValue) => {
  const index = args.indexOf(key);
  return index !== -1 && args.length > index + 1 ? args[index + 1] : defaultValue;
};
const watch = args.includes('--watch');
const deploy = args.includes('--deploy');
const outDir = getArgValue('--outdir', 'dist');
const outDirPath = path.resolve(__dirname, outDir);
const entryPoints = [
  path.join(__dirname, "src", "index.ts"),
  path.join(__dirname, "src", "graphene.css"),
];


const loader = {
    '.woff': 'file',
    '.woff2': 'file',
};

const plugins = [
  {
    name: "carbon-number-input-step-fix",
    setup(build) {
      build.onLoad(
        {
          filter: /@carbon[\\/]web-components[\\/]es[\\/]components[\\/]number-input[\\/]number-input\\.js$/,
        },
        async (args) => {
          const contents = await fs.readFile(args.path, "utf8");
          const patched = contents.replace(
            "return this._step.toString();",
            'return (this._step ?? "1").toString();'
          );

          return { contents: patched, loader: "js" };
        }
      );
    },
  },
];

// Define esbuild options
let opts = {
    entryPoints,
    bundle: true,
    logLevel: "info",
    platform: "browser",
    target: "es2017",
    format: "esm",
    splitting: true,
    chunkNames: "chunks/[name]-[hash]",
    outdir: outDirPath,
    loader: loader,
    plugins: plugins,
};

async function patchNumberInputStep(outDir) {
    const indexPath = path.join(outDir, "index.js");
    try {
        let contents = await fs.readFile(indexPath, "utf8");
        const replacements = [
            [/this\\._step\\.toString\\(\\)/g, '(this._step ?? "1").toString()'],
            [/this\\._min\\.toString\\(\\)/g, '(this._min ?? "").toString()'],
            [/this\\._max\\.toString\\(\\)/g, '(this._max ?? "").toString()'],
            [/\\.requestUpdate\\(\\)/g, '.requestUpdate?.()'],
        ];
        let patched = contents;
        replacements.forEach(([pattern, replacement]) => {
            patched = patched.replace(pattern, replacement);
        });
        if (patched !== contents) {
            await fs.writeFile(indexPath, patched);
        }
    } catch (_error) {
        // best-effort patch; ignore if file missing
    }
}

if (deploy) {
    opts = {
        ...opts,
        //minify: true,
        splitting: true,
        chunkNames: "chunks/[name]-[hash]",
    };
}

if (watch) {
    opts = {
        ...opts,
        sourcemap: "inline",
    };
    esbuild
        .context(opts)
        .then((ctx) => {
            ctx.watch();
        })
        .catch((_error) => {
            process.exit(1);
        });
} else {
    esbuild
        .build(opts)
        .then(() => patchNumberInputStep(outDirPath))
        .catch((_error) => {
            process.exit(1);
        });
}
