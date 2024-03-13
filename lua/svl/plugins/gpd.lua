return {
	"rmagatti/goto-preview",
	event = "VeryLazy",
	config = function()
		local gpd = require("goto-preview")
		gpd.setup()

		-- keybindings
		vim.keymap.set(
			"n",
			"gp",
			"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
			{ desc = "Go to preview", noremap = true }
		)
	end,
}
