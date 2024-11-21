return {
	"nvimdev/lspsaga.nvim",
	after = "nvim-lspconfig",
	config = function()
		require("lspsaga").setup({})
	end,
}
