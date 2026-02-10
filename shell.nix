{
  pkgs ? import <nixpkgs> {},
  lib ? pkgs.lib,
  ...
}:
let

in
pkgs.mkShell {
  name = "phoenix shell";
  packages =
    (with pkgs; [
      cargo
      rustc
      nodejs
      deno
      nixpkgs-fmt
      elixir
      elixir-ls
      yarn
      prettier
      tailwindcss_4
      esbuild
      watchman
    ])
    ++ (
      lib.optionals pkgs.stdenv.isDarwin (
        with pkgs;
        [ terminal-notifier ]
        ++ (with darwin.apple_sdk.frameworks; [
          CoreFoundation
          CoreServices
        ])
      )
      ++ (lib.optionals pkgs.stdenv.isLinux (
        with pkgs;
        [
          libnotify
          inotify-tools
        ]
      ))
    );
  shellHook = ''
    export PROJECT_ROOT=$(git rev-parse --show-toplevel)
    # set common root for the nix shell in the repo root
    export NIX_SHELL_DIR=$PROJECT_ROOT/.nix-shell
    mkdir -p $NIX_SHELL_DIR

    # Put any Mix-related data in the project directory.
    export MIX_HOME=$NIX_SHELL_DIR/.mix
    export MIX_ARCHIVES=$MIX_HOME/archives
    export HEX_HOME=$NIX_SHELL_DIR/.hex


    export PATH=$MIX_HOME/bin:$PATH
    export PATH=$HEX_HOME/bin:$PATH
    export PATH=$MIX_HOME/escripts:$PATH
  '';
}
