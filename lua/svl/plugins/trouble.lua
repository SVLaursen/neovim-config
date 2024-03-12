return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Custom keymappings
		local trouble = require("trouble")
		local keymap = vim.keymap

		keymap.set("n", "<leader>xx", function()
			trouble.toggle()
		end)
		keymap.set("n", "<leader>xw", function()
			trouble.toggle("workspace_diagnostics")
		end, { desc = "Show workspace trouble" })
		keymap.set("n", "<leader>xd", function()
			trouble.toggle("document_diagnostics")
		end, { desc = "Show document trouble" })
		keymap.set("n", "<leader>xq", function()
			trouble.toggle("quickfix")
		end, { desc = "Show trouble quickfix " })
		keymap.set("n", "<leader>xl", function()
			trouble.toggle("loclist")
		end, { desc = "Show trouble location list" })
		keymap.set("n", "gR", function()
			trouble.toggle("lsp_references")
		end, { desc = "Show trouble LSP references" })
	end,
}
