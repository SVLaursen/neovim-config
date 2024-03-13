return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		require("dapui").setup()
		require("nvim-dap-virtual-text").setup()

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		-- Keybindings
		local setkeymap = vim.api.nvim_set_keymap
		setkeymap("n", "<leader>dt", ":DapUiToggle<CR>", { desc = "Toggle DAP", noremap = true })
		setkeymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint", noremap = true })
		setkeymap("n", "<leader>dc", ":DapContinue<CR>", { desc = "Continue DAP", noremap = true })
		setkeymap(
			"n",
			"<leader>ht",
			":lua require('harpoon.ui').toggle_quick_menu()<CR>",
			{ desc = "Reset DAP UI", noremap = true }
		)
	end,
}
