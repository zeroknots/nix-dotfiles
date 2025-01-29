return {
	"ThePrimeagen/harpoon",
	dependencies = "nvim-lua/plenary.nvim",
	opts = {
		global_settings = { mark_branch = true },
		width = vim.api.nvim_win_get_width(0) - 4,
	},
	keys = {
		{
			"<leader>ha",
			'<cmd>lua require("harpoon.mark").add_file()<cr>',
			{ silent = true, desc = "Harpoon add file" },
		},
		{ "<leader>hh", "<cmd>Telescope harpoon marks<cr>", { silent = true, desc = "Telescope Harpoon mark" } },
	},
}
