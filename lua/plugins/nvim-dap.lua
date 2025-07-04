return {
		"mfussenegger/nvim-dap",
		dependencies = {
				"mfussenegger/nvim-dap-python",
				"Microsoft/vscode-cpptools",
				"Samsung/netcoredbg",
				"rcarriga/nvim-dap-ui",
				"theHamsta/nvim-dap-virtual-text",
				"nvim-neotest/nvim-nio",
		},
		config = function()
				local dap = require("dap")
				local dapui = require("dapui")
				local python = require("dap-python")
				local venvSelector = require("venv-selector")

				dap.listeners.before.attach.dapui_config = function()
						dapui.open()
				end

				dap.listeners.before.launch.dapui_config = function()
						dapui.open()
				end

				vim.api.nvim_create_user_command("DapCloseUI", function()
						require("dapui").close()
				end, {})
		end,
}
