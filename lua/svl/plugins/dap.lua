local js_based_languages = {
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vue",
}

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"microsoft/vscode-js-debug",
			build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
			version = "1.*",
		},
		{
			"mxsdev/nvim-dap-vscode-js",
			config = function()
				require("dap-vscode-js").setup({
					debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
					adapters = {
						"pwa-node",
						"pwa-extensionHost",
						"node-terminal",
						"node",
					},
				})
			end,
		},
		{
			"Joakker/lua-json5",
			build = "./install.sh",
		},
	},
	config = function()
		local dap = require("dap")

		dap.set_log_level("DEBUG")
		vim.keymap.set("n", "<leader>db", function()
			if vim.fn.filereadable(".vscode/launch.json") then
				local dap_vscode = require("dap.ext.vscode")
				dap_vscode.load_launchjs(nil, {
					["pwa-node"] = js_based_languages,
					["chrome"] = js_based_languages,
					["pwa-chrome"] = js_based_languages,
					["node-terminal"] = js_based_languages,
					["node"] = js_based_languages,
				})
			end

			dap.continue()
		end)

		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dc", dap.continue, {})
		vim.keymap.set("n", "<leader>ds", dap.step_over, {})
		vim.keymap.set("n", "<leader>di", dap.step_into, {})
		vim.keymap.set("n", "<leader>do", dap.step_out, {})

		vim.keymap.set("n", "<leader>dp", function()
			require("dap.ui.widgets").preview()
		end)

		vim.keymap.set("n", "<leader>dr", function()
			dap.repl.open({}, "vsplit")
		end, {})

		vim.keymap.set({ "n", "v" }, "<leader>dh", function()
			require("dap.ui.widgets").hover()
		end)

		vim.keymap.set("n", "<leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end)

		vim.keymap.set("n", "<leader>du", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)

		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "💀", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "➡️➡️", texthl = "", linehl = "", numhl = "" })

		-- Adapter Configuration
		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				-- NodeJS - Single File
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch File",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
				},
				-- NodeJS - Start CAP-TS
				{
					command = "NODE_OPTIONS='--inspect-brk' cds-ts run",
					name = "Launch CAP-TS Dev",
					request = "launch",
					type = "node-terminal",
					cwd = vim.fn.getcwd(),
					skipFiles = { "<node_internals>/**" },
				},
				-- NodeJS - Auto Attach Process
				{
					type = "pwa-node",
					request = "attach",
					name = "Auto Attach To Process",
					cwd = vim.fn.getcwd(),
					skipFiles = { "<node_internals>/**" },
				},
				-- NodeJS - Select Process
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach To Process",
					processId = require("dap.utils").pick_process,
					cwd = vim.fn.getcwd(),
					skipFiles = { "<node_internals>/**" },
				},
				-- NodeJS - Attach to Cloud Foundry
				{
					type = "pwa-node", -- NOTE: Maybe this should be node-terminal?
					request = "attach",
					name = "Attach To Cloud Foundry",
					address = "localhost",
					port = 9229,
					localRoot = vim.fn.getcwd(),
					remoteRoot = "/home/vcap/app",
				},
				-- Divider for launch.json derived configs
				{
					name = "----- ↓ launch.json configs ↓ -----",
					type = "",
					request = "launch",
				},
			}
		end
	end,
}
