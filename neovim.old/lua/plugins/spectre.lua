return {
	"nvim-pack/nvim-spectre",
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
  },
	config = function(_, opts)
		require("spectre").setup(opts)
	end,
	opts = {
		replace_engine = {
			["sed"] = {
				cmd = "sed",
				args = {
					"-i",
					"",
					"-E",
				},
			},
		},
	},
}
