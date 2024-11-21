return {
	"simrat39/rust-tools.nvim",
	dependecy = {
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local rt = require("rust-tools")
		local mason_registry = require("mason-registry")
		local codelldb = mason_registry.get_package("codelldb")
		local extension_oath = codelldb:get_install_path() .. "/extension"
		local codelldb_path = extension_oath .. "adapter/codelldb"
		local liblldbn_path = extension_oath .. "lldb/lib/liblldb.dylib"
		rt.setup({
			dap = {
				adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldbn_path),
			},
			server = {
				on_attach = function(_, bufnr)
					-- Hover actions
					vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
			tools = {
				hover_actions = {
					auto_focus = false,
				},
			},
		})
	end,
}
