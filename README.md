# My Neovim Configuration

This is my personal Neovim configuration, which is based upon Primagens really neat setup that you can find [here](https://github.com/ThePrimeagen/init.lua).
Main changes are that I do not use all of the keymappings made in his setup, and that I have a weakness for the Gruvbox theme!

## Dependencies

In order to user this configuration you must use a package/plugin manager, for this I went with [packer.nvim](https://github.com/wbthomason/packer.nvim).

When you first set up the configuration, open a Neovim session and enter:

```zsh
:so
:PackerSync
```

After a little second or two, all dependencies should be installed and you're ready to go!

## Theme

As mentioned, I have a huge weakness for the Gruvbox theme style, so I've therefore decided to use [eddyekofo94's gruvbox.nvim](https://github.com/eddyekofo94/gruvbox-flat.nvim).
This theme is specifically very nice on the eyes, even after multiple hours of staring at the screen. That, and the direct integration with Lualine is what got me sold on this specific version of gruvbox.

## Plugins Used

| Name | Category | Description |
|------|----------|-------------|
| eddyekofo94/gruvbox-flat.nvim | Visuals | My theme of choice |
| tpope/vim-fugitive | Integrations | Nice set of Git commands |
| VonHeikemen/lsp-zero.nvim | LSP | A nice plugin that handles most of the LSP boiletplate up front. Comes with nvim-cmp and mason.nvim out of the box |
| nvim-treesitter/nvim-treesitter | Highlighting | |
| nvim-telescope/telescope.nvim | Finder | |
| nvim-telescope/telescope-fzy-native.nvim | Finder | |
| lewis6991/impatient.nvim | Performance | |
| nvim-lualine/lualine.nvim | Visuals | |
| mbbill/undotree | QoL | |
| windwp/nvim-autopairs | QoL | |
| nvim-neo-tree/neo-tree.nvim | Visuals | |
| j-hui/fidget.nvim | Visuals | |

