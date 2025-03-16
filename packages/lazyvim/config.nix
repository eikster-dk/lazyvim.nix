{ pkgs
, ...
}:
let
  ## TODO perform lsp installation with nix instead of mason
  lspToolingPkgs = with pkgs;
    [
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

  '';

  passthru.lspToolingPkgs = lspToolingPkgs;
}
