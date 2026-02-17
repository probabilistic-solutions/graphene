const esbuild = require("esbuild");
const fs = require("fs");
const path = require("path");
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

function patchNumberInputStep(outDir) {
    const targets = ["js/app.js", "js/storybook.js"];
    targets.forEach((file) => {
        const filePath = path.join(outDir, file);
        try {
            let contents = fs.readFileSync(filePath, "utf8");
            const replacements = [
                [ /this\\._step\\.toString\\(\\)/g, '(this._step ?? "1").toString()' ],
                [ /this\\._min\\.toString\\(\\)/g, '(this._min ?? "").toString()' ],
                [ /this\\._max\\.toString\\(\\)/g, '(this._max ?? "").toString()' ],
                [ /\\.requestUpdate\\(\\)/g, ".requestUpdate?.()" ],
            ];
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
}

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
    const runBuild = async () => {
        await esbuild.build(opts);
        patchNumberInputStep(opts.outdir);
    };

    runBuild().catch((_error) => {
        process.exit(1);
    });
}
