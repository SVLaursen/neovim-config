local opts = { noremap = true, silent = true }

-- Shorthand
local keymap = vim.api.nvim_set_keymap
local setmap = vim.keymap.set

-- Leader key setup
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Back out into file directory
local status_ok, _ = pcall(require, "nvim-tree")
if not status_ok then
    setmap("n", "<leader>pv", vim.cmd.Ex) -- If nvim-tree is not installed then use default
else
    keymap("n", "<leader>pv", ":NvimTreeToggle<Enter>", opts)
end

-- Move text
setmap("v", "J", ":m '>+1<CR>gv=gv")
setmap("v", "K", ":m '<-2<CR>gv=gv")

-- Move text up and down (Not working with my current keyboard settings)
keymap("n", "<leader>/j", "<Esc>:m .+1<CR>", opts)
keymap("n", "<leader>/k", "<Esc>:m .-2<CR>", opts)

-- Delete space between lines
setmap("n", "J", "mzJ`z")

-- Fast navigate up/down
setmap("n", "<C-u>", "<C-u>zz")
setmap("n", "<C-d>", "<C-d>zz")

setmap("n", "n", "nzzzv")
setmap("n", "N", "Nzzzv")

-- greatest remap ever
setmap("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
setmap({ "n", "v" }, "<leader>y", [["+y]]) -- Yank block
setmap("n", "<leader>Y", [["+Y]])        -- Yank entire line

setmap({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
setmap("i", "<C-c>", "<Esc>")

-- Nope out of Q
setmap("n", "Q", "<nop>")

-- Lint/Format Current Document
setmap("n", "<leader>f", vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
setmap("n", "<leader>k", "<cmd>lnext<CR>zz")
setmap("n", "<leader>j", "<cmd>lprev<CR>zz")

setmap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Window movement remaps
setmap("n", "<C-l>", "<C-w>l") -- Move to left window
setmap("n", "<C-h>", "<C-w>h") -- Move to right window
setmap("n", "<C-j>", "<C-w>j") -- Move to below window
setmap("n", "<C-k>", "<C-w>k") -- Move to above window

-- Visual Block -> Move text up and down
keymap("x", "J", ":m '>+1<CR>gv-gv", opts)
keymap("x", "K", ":m '<-2<CR>gv-gv", opts)

-- Buffer switching
setmap("n", "<leader>nb", ":bnext<Enter>")
setmap("n", "<leader>pb", ":bprevious<Enter>")
