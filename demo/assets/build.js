const esbuild = require("esbuild");
const { sassPlugin } = require('esbuild-sass-plugin');
// TODO
// const postcss = require('postcss')
// const autoprefixer = require('autoprefixer')
// const postcssPresetEnv = require('postcss-preset-env')

const { copy } = require('esbuild-plugin-copy')

const args = process.argv.slice(2);
const watch = args.includes('--watch');
const deploy = args.includes('--deploy');

const loader = {
    '.woff': 'file',
    '.woff2': 'file',
};

const plugins = [
    copy({
        assets: [
            {
                from: [
                    'node_modules/@ibm/plex/**/*.woff',
                    'node_modules/@ibm/plex/**/*.woff2',
                ],
                to: 'fonts'
            }
        ],
    }),
    sassPlugin({
        // TODO: Those are copied from elixir task make sure to apply similar flags
        // "sass default --no-source-map --style=compressed --load-path node-modules",
        include: ['/\.scss$/', '**/*.scss', '**/*.sass'],
        loadPaths: ["node_modules", ".", ".."],
        // TODO: configure autoprefixer as per Carbon docs
        // async transform(source, resolveDir) {
        //   const { css } = await postcss([autoprefixer,
        //     postcssPresetEnv({ stage: 0 })]).process(source)
        //   return css
        // },
    }),
];

// Define esbuild options
let opts = {
    entryPoints: [
        "css/app.scss",
        "css/storybook.scss",
        "js/app.ts",
        "js/storybook.ts",
    ],
    bundle: true,
    logLevel: "info",
    platform: "browser",
    target: "es2020",
    format: "esm",
    outdir: "../priv/static/assets",
    external: ["../fonts/*", "images/*"],
    loader: loader,
    plugins: plugins,
    inject: ["./process_polyfill.js"],
};

if (deploy) {
    opts = {
        ...opts,
        minify: true,
    };
}

if (watch) {
    opts = {
        ...opts,
        // sourcemap: "inline",
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
