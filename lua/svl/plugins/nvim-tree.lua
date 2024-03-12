return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")
		-- local nvimtree_api = require("nvim-tree.api")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

		-- configure nvim-tree
		-- local tree_cb = nvimtree_api.tree.nvim_tree_callback

		nvimtree.setup({
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			renderer = {
				root_folder_modifier = ":t",
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			view = {
				width = 30,
				side = "left",
				-- mappings = {
				-- 	list = {
				-- 		{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				-- 		{ key = "h", cb = tree_cb("close_node") },
				-- 		{ key = "v", cb = tree_cb("vsplit") },
				-- 	},
				-- },
			},
		})

		-- Shorthand
		local keymap = vim.api.nvim_set_keymap
		keymap("n", "<leader>pv", ":NvimTreeToggle<Enter>", {
			desc = "Open file tree",
			noremap = true,
			silent = true,
		})
	end,
}
