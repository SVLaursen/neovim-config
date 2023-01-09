-- https://github.com/akinsho/toggleterm.nvim
require("toggleterm").setup{
    shade_terminals = false
}

local Terminal = require('toggleterm.terminal').Terminal

-- LazyGit terminal setup
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _lazygit_toggle()
    lazygit:toggle()
end

-- Terminal - Standard use
local termdrawer = Terminal:new({ hidden = true, direction = "float" })
function _toggle_term()
    termdrawer:toggle()
end

-- Keymapping
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", opts)
keymap("n", "<leader>tg", "<cmd>lua _toggle_term()<CR>", opts)

-- Custom Commands
-- TODO: Add in custom commands for opening the terminal as float, vertical or tray
-- TODO: Add in custom commands for opening additional terminals?
--vim.api.nvim_add_user_command('tf', function(opts) end, { nargs = 1 })

-- ToggleTerm built-in keymaps (do not alter)
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
