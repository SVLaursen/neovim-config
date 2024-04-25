return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	version = "*",
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local obsidian = require("obsidian")
		obsidian.setup({
			workspaces = {
				{
					name = vim.env.VAULT_NAME,
					path = vim.env.VAULT_PATH,
				},
			},
			notes_subdir = "inbox",
			new_notes_location = "notes_subdir",
			disable_frontmatter = true,
			templates = {
				subdir = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M:%S",
			},
			mapping = {
				["gf"] = {
					action = function()
						return obsidian.util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
		})

		-- Custom workflows
		-- convert note to template and remove leading white space
		vim.keymap.set("n", "<leader>vn", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
		-- strip date from note title and replace dashes with spaces
		-- must have cursor on title
		vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")

		vim.opt.conceallevel = 1
	end,
}
