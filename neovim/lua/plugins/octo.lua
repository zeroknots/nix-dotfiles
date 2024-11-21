return {
	"pwntester/octo.nvim",
	cmd = "Octo",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function(_, opts)
		require("octo").setup(opts)
		vim.treesitter.language.register("markdown", "octo")
	end,

	opts = {

		enable_builtin = true,
		mappings = {
			submit_win = {
				approve_review = { lhs = "<space>a", desc = "approve review" },
				comment_review = { lhs = "<space>c", desc = "comment review" },
				request_changes = { lhs = "<space>r", desc = "request changes review" },
				close_review_tab = { lhs = "<space>x", desc = "close review tab" },
			},
		},
	},
	keys = {
		{ "<leader>o", "<cmd>Octo<cr>", desc = "Octo" },
		{ "<leader>oi", "<cmd>Octo issue list<cr>", desc = "Octo list issues" },
		{ "<leader>op", "<cmd>Octo pr list<cr>", desc = "Octo list PRs" },
	},
}
