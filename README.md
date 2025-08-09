# dr3am1ngg's Neovim Setup

This is my minimalistic Neovim setup with stuff I use for increasing my productivity in coding sessions.
It contains a lot of useful keymaps that I use.

## Plugins

I have installed [folke/lazy.nvim](https://github.com/folke/lazy.nvim) package manager and here is the list of installed plugins:
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - Pretty good-looking theme (using 'moon' version)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Must have plugin for file searching (there is a lot that this plugin can do, but I haven't discovered it yet lmao)
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - Useful tree file explorer like in VS Code (it's useful for me but some people don't like those things I suppose)
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - I like to see what files are opened and toggle between them fastly
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - I suppose it doesn't work well with Hyprland, but it is here for someone who needs it
- [terrortylor/nvim-comment](https://github.com/terrortylor/nvim-comment) - It's very satisfying to comment things with a simple keybind rather than go and comment it manually
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - I use zsh with Powerlevel10k theme and I like to see those things in my terminal :)
- [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) - Plugin for LuaLS to find 'vim' global var
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) & [saghen/blink.cmp](https://github.com/Saghen/blink.cmp) - Code autocompletion
- [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim) - LSP, DAP, Formatter, Linter manager with one button installation
- [mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) - LSP configuration (there is 'ts_ls' commented out, because it didn't work for me, so I will look at that later)

## Requirements

It should work pretty much instantly, but I know that there is some requirements for some things:

- NeoVim >= 0.10.0 (I use nightly)
- curl
- git
- rustup (Rust Nightly to build fuzzy matcher for blink.cmp)

If there is more reqs that I should include here, you can make a pull request of README.md

## Installation

Just clone this repo into your nvim config directory. For example, for Arch:
```bash
git clone --branch=master git@github.com:dr3am1ngg0v/nvim-cfg ~/.config/nvim
or
git clone --branch=master https://github.com/dr3am1ngg0v/nvim-cfg ~/.config/nvim
```

## Keybinds and options

There are keybinds and options both for NeoVim and it's plugins.
NeoVim options and keybinds are in ./lua/keymaps.lua and ./lua/options.lua files.
Plugins options and keybinds are in ./lua/plugins/keymaps.lua and ./lua/plugins/options.lua files.
