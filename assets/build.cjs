const esbuild = require("esbuild");
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

];

// Define esbuild options
let opts = {
    entryPoints,
    bundle: true,
    logLevel: "info",
    platform: "browser",
    target: "es2017",
    format: "esm",
    outdir: outDirPath,
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
