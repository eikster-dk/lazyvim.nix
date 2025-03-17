{ pkgs
, lib
, ...
}:
let
  lspPackages = with pkgs;
    [
      clang-tools
      delve
      go
      gofumpt
      golangci-lint
      golines
      gomodifytags
      gopls
      gotests
      gotools
      govulncheck
      iferr
      impl
      isort
      marksman
      nil
      nodePackages.bash-language-server
      nodePackages.prettier
      nodejs
      sqlfluff
      stylua
      sumneko-lua-language-server
    ];
in
pkgs.stdenv.mkDerivation {
  name = "lazyvim-config";

  phases = "installPhase";

  installPhase = ''
    # create out dir
    mkdir -p $out/parser

    # copy the astronvim config
    cp -rs ${./config}/. $out

    ${lib.concatMapStringsSep "\n" (grammar: ''
      ln -s $(readlink -f ${grammar}/parser/*.so) $out/parser/${lib.last (builtins.split "-" grammar.name)}.so
    '')
    pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies}
  '';

  passthru.lspPackages = lspPackages;
}
