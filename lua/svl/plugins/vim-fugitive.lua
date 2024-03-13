return {
	"tpope/vim-fugitive",
	config = function()
		local svl_fugitive = vim.api.nvim_create_augroup("svl_fugitive", {})
		local autocmd = vim.api.nvim_create_autocmd

		autocmd("BufWinEnter", {
			group = svl_fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "<leader>p", function()
					vim.cmd.Git("push")
				end, { desc = "Git Push" })

				-- rebase always
				vim.keymap.set("n", "<leader>P", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, { desc = "Git pull with rebase" })

				-- TODO: Git commit with message

				-- NOTE: It allows me to easily set the branch i am pushing and any tracking
				-- needed if i did not set the branch up correctly
				opts.desc = "Git Push Origin"
				vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
			end,
		})

		-- Keymappings
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Execute Git" })
	end,
}
