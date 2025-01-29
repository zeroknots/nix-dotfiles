return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		picker = {},
		lazygit = {},
		scroll = {},
	},
	keys = {

		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
	},
}
