return {
	"utilyre/barbecue.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	name = "barbecue",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	-- @type barbecue.Config
	opts = {
		theme = "tokyonight",
	},
}
