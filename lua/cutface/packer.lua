-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Impatient.nvim configuration
  use 'lewis6991/impatient.nvim'

  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  requires = {
          {'nvim-lua/plenary.nvim'},
          "BurntSushi/ripgrep",
          "nvim-tree/nvim-web-devicons"
      }
  }

  use('nvim-telescope/telescope-fzy-native.nvim')

  -- Lualine -> Better control line
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opts = true }
  }

  -- Theme -> Gruvbox
  use({
      'eddyekofo94/gruvbox-flat.nvim',
      as = 'gruvbox-flat',
      config = function()
          --vim.cmd("colorscheme gruvbox-flat")
      end
  })

  -- Treesitter setup
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- Harpoon setup
  use('theprimeagen/harpoon')
  -- Undotree setup
  use('mbbill/undotree')
  -- VimFugitive setup
  use('tpope/vim-fugitive')

  -- Autoclose setup
  use('windwp/nvim-autopairs')

  -- NeoTree setup
 use{
     'nvim-tree/nvim-tree.lua',
     requires = {
         'nvim-tree/nvim-web-devicons',
     },
     tag = 'nightly'
 }

  -- LSP -> lsp-zero setup
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- Fidget: LSP Progress Indicator
  use("j-hui/fidget.nvim")

  -- ToggleTerm - Terminal for Neovim
  use {
      "akinsho/toggleterm.nvim",
      tag = '*'
  }

  use {
      'lewis6991/gitsigns.nvim',
      tag = 'release'
  }

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")

end)
