return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local todo_comments = require("todo-comments")
		todo_comments.setup()

		-- Custom keymappings
		local keymap = vim.keymap
		keymap.set("n", "<leader>qf", ":TodoQuickFix<Enter>", { desc = "Quick Fix TODO" })
		keymap.set("n", "<leader>tl", ":TodoTelescope<Enter>", { desc = "Open TODO View" })
	end,
}
