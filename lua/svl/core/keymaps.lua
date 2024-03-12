-- Keymappings setup -----------------------
--------------------------------------------
-- normal_mode       = "n",
--  insert_mode       = "i",
-- visual_mode       = "v",
-- visual_block_mode = "x",
-- term_mode         = "t",
-- command_mode      = "c",
--------------------------------------------

-- set leader key
vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--------------------------------------------
-- General Keymaps -------------------------
--------------------------------------------

-- Move Text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Delete space between lines
keymap.set("n", "J", "mzJ`z")

-- Fast navigation up/down
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

-- Fast move between previously searched keyword
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Quick yank utility
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank block
keymap.set("n", "<leader>Y", [["+Y]]) -- Yank entire line

-- Quick delete desired blocks
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Control+c is not quit app but instead cancel (i.e. Escape)
keymap.set("i", "<C-c>", "<Esc>")

-- Nope out of Q
keymap.set("n", "Q", "<nop>")

-- Lint/format current buffer
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Skip to next location
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace word (without lsp)
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Window movement remaps
keymap.set("n", "<C-l>", "<C-w>l") -- Move to left window
keymap.set("n", "<C-h>", "<C-w>h") -- Move to right window
keymap.set("n", "<C-j>", "<C-w>j") -- Move to below window
keymap.set("n", "<C-k>", "<C-w>k") -- Move to above window

-- Visual Block -> Move text up and down
keymap.set("x", "J", ":m '>+1<CR>gv-gv", opts)
keymap.set("x", "K", ":m '<-2<CR>gv-gv", opts)

-- Back out into file directory
local status_ok, _ = pcall(require, "nvim-tree")
if not status_ok then
	vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- If nvim-tree is not installed then use default
else
	vim.api.nvim_set_keymap("n", "<leader>pv", ":NvimTreeToggle<Enter>", opts)
end
