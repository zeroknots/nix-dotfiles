return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	setup = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>", { desc = "Temrinate Debugging" })
		vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>", { desc = "Debug step over" })
	end,
}
