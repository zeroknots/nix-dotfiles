return {
	"windwp/nvim-autopairs",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function(_, opts)
		local autopairs = require("nvim-autopairs")
		autopairs.setup(opts)
	end,

	opts = {
		check_ts = true,
		ts_config = {
			lua = { "string" }, -- don't add pairs in lua string treesitter nodes
			javascript = { "template_string" },
			java = false,
		},
	},
}
