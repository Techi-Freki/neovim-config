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
				vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle a breakpoint" })
				vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue debugging" })
		end,
}
