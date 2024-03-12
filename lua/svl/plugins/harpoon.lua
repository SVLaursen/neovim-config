return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- Custom keymappings
		local keymap = vim.keymap

		keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", {
			desc = "Harpoon: Add File",
		})
		keymap.set("n", "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", {
			desc = "Harpoon: Open UI",
		})

		keymap.set(
			"n",
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "Go to next harpoon mark" }
		)
		keymap.set(
			"n",
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Go to previous harpoon mark" }
		)
	end,
}
