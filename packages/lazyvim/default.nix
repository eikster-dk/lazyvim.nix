{ pname
, flake
, inputs
, perSystem
, pkgs
, ...
}:
let
  inherit (pkgs) lib;
  config = import ./config.nix { inherit pkgs lib; };
in

pkgs.writeShellScriptBin "nvim" ''
  set -efu
  unset VIMINIT
  export PATH=${pkgs.buildEnv {
    name = "lsp-servers";
    paths = config.lspPackages;
  }}/bin:$PATH

  export NVIM_APPNAME="eikster-lazyvim"

  # Ensure XDG folders
  XDG_CONFIG_HOME=''${XDG_CONFIG_HOME:-$HOME/.config}
  XDG_DATA_HOME=''${XDG_DATA_HOME:-$HOME/.local/share}
  mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME"

  NVIM_CONFIG="$XDG_CONFIG_HOME/$NVIM_APPNAME"
  NVIM_DATA="$XDG_DATA_HOME/$NVIM_APPNAME"

  # Link custom config and install plugins
  ln -sfT ${config} "$NVIM_CONFIG"
  ${pkgs.neovim}/bin/nvim --headless -c 'quitall'

  exec ${pkgs.neovim}/bin/nvim "$@"
''

