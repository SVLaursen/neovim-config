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
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move chunk down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move chunk up" })

-- Delete space between lines
keymap.set("n", "J", "mzJ`z", { desc = "Delete space between lines " })

-- Fast navigation up/down
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Fast navigation up" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Fast navigation down" })

-- Fast move between previously searched keyword
keymap.set("n", "n", "nzzzv", { desc = "Move between last searched - down" })
keymap.set("n", "N", "Nzzzv", { desc = "Move between last searched - up" })

-- Quick yank utility
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Quick yank block" }) -- Yank block
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Quick yank line" }) -- Yank entire line

-- Quick delete desired blocks
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete marked block" })

-- Control+c is not quit app but instead cancel (i.e. Escape)
keymap.set("i", "<C-c>", "<Esc>", { desc = "Abort insert" })

-- Nope out of Q
keymap.set("n", "Q", "<nop>") -- Does not need a desc as it is a nope out

-- Lint/format current buffer
keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Quick format buffer" })

-- Skip to next location
-- BUG: This one is not acting as inteded at the moment
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Skip to next location up" })
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Skip to next location down" })

-- Replace word (without lsp)
keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace all instances of word in buffer" }
)

-- Window movement remaps
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to left window" }) -- Move to left window
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to right window" }) -- Move to right window
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" }) -- Move to below window
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" }) -- Move to above window

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

-- Save file fast
keymap.set("n", "<C-s>", "<cmd>write<CR>", { desc = "Save current buffer" })
