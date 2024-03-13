return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
	},
	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"stylua",
				"jq",
				"go-debug-adapter",
				"js-debug-adapter",
			},
			--handlers = {}, -- sets up dap in the predefined manner
		})
	end,
}
