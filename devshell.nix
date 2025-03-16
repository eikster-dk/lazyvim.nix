{ pkgs }:
pkgs.mkShell {
  # Add build dependencies
  packages = [
    pkgs.neovim
  ];

  # Add environment variables
  env = { };

  # Load custom bash code
  shellHook = ''

  '';
}
