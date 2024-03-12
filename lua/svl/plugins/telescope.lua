return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "truncate " },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,     -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            }
        })

        -- Keymappings
        local builtin = require('telescope.builtin')
        local keymap = vim.keymap
        keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Open file explorer" })
        keymap.set("n", "<C-p>", builtin.git_files, { desc = "Open git file explorer" })
        keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffer search" })
        keymap.set("n", "<leader>fc", builtin.commands, { desc= "Command search" })
        keymap.set("n", "<leader>ps", builtin.grep_string, { desc = "Find string under cursor in cwd" })
    end
}

