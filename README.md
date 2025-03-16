# lazyvim.nix

this is my attempt at having a somewhat nix based nvim / lazyvim configuration that is reusable.

It's still a work in progress

## Why?

Having my configuration ready as a `flake` allows me to run `nvim` wherever I want!

**Note**: This is a personal configuration tailored to my specific needs. Feel free to fork this repository and customize on your own!

## Setup

### \[Optional\] Add flake registry shortcut

You can add the following registry shortcut to type less characters:

```console
nix registry add nvim-eikster github:eikster-dk/lazyvim.nix
```

## Running my Astro NeoVim

Just issue the following command:

```console
nix run github:eikster-dk/lazyvim.nix#lazyvim
```

## Acknowledgements

Ideas has been shamelessly taken from [Aldo Borrero](https://github.com/aldoborrero/astronvim.nix) and [Brian McGee](https://github.com/brianmcgee/astronvim.nix/blob/main/README.md), who took inspiration from the one, the only, [@Mic92](https://github.com/mic92/dotfiles)!

## License

See [License](License) for more information.
