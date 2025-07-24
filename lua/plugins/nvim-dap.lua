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
				local venvSelector = require("venv-selector")

				require("dapui").setup()
				require("nvim-dap-virtual-text").setup({
						commented = true,
				})

				vim.fn.sign_define("DapBreakpoint", {
						text = "",
						texthl = "DiagnosticSignError",
						linehl = "",
						numhl = "",
				})

				vim.fn.sign_define("DapBreakpointRejected", {
						text = "",
						texthl = "DiagnosticSignError",
						linehl = "",
						numhl = "",
				})

				vim.fn.sign_define("DapStopped", {
						text = "",
						texthl = "DiagnosticSignWarn",
						linehl = "Visual",
						numhl = "DiagnosticSignWarn",
				})

				dap.listeners.after.event_initialized.dapui_config = function()
						dapui.open()
				end
		end,
}
