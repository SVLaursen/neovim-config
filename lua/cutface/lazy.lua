-- Lazy package manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy Package Manager plugin registration
require("lazy").setup({
    -- Impatient for faster loading
    "lewis6991/impatient.nvim",

    -- Telescope setup
    { "nvim-telescope/telescope.nvim",
       branch = "0.1.x",
       dependencies = {
            { 'nvim-lua/plenary.nvim' },
            "BurntSushi/ripgrep",
            "nvim-tree/nvim-web-devicons"
       }
    },

    "nvim-telescope/telescope-fzy-native.nvim",

    -- Lualine (Better control line)
    { "nvim-lualine/lualine.nvim",
      opts = true,
      dependencies = {
          'nvim-tree/nvim-web-devicons'
      }
    },

    -- Theme -> Catpuccin Mocha
    { "catppuccin/nvim", name = "catppuccin" },

    -- Treesitter setup
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'nvim-treesitter/playground',

    -- Harpoon setup
    'theprimeagen/harpoon',
    -- Undotree setup
    'mbbill/undotree',
    -- VimFugitive setup
    'tpope/vim-fugitive',

    -- Autoclose setup
    'windwp/nvim-autopairs',

    -- NeoTree setup
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        tag = 'nightly'
    },

    -- LSP -> lsp-zero setup
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
        "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            { "lukas-reineke/lsp-format.nvim", config = true },}
    },

    -- ToggleTerm - Terminal for Neovim
    {
        "akinsho/toggleterm.nvim"
    },

    {
        'lewis6991/gitsigns.nvim',
        tag = 'release'
    },

    -- Markdown previewer (Peek) (requires Deno)
    {
        'toppair/peek.nvim',
        lazy = true,
        build = 'deno task --quiet build:fast',
        cmd = {
            'PeekOpen'
        }
    },

    -- TODO: Re-enable this soon!
    --use("github/copilot.vim")

    -- TODO COMMENTS
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
})
