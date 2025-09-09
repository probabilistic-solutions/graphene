const esbuild = require("esbuild");

const getArgValue = (key, defaultValue) => {
  const index = args.indexOf(key);
  return index !== -1 && args.length > index + 1 ? args[index + 1] : defaultValue;
};


const args = process.argv.slice(2);
const watch = args.includes('--watch');
const deploy = args.includes('--deploy');
const outDir = getArgValue('--outdir', 'dist');


const loader = {
    '.woff': 'file',
    '.woff2': 'file',
};

const plugins = [

];

// Define esbuild options
let opts = {
    entryPoints: [
        "src/index.ts",
    ],
    bundle: true,
    logLevel: "info",
    platform: "browser",
    target: "es2017",
    format: "esm",
    outdir: outDir,
    loader: loader,
    plugins: plugins,
};

if (deploy) {
    opts = {
        ...opts,
        //minify: true,
        splitting: true,
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
    esbuild.build(opts);
}
