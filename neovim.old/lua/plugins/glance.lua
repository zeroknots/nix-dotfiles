return {
	"dnlhc/glance.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	cmd = "Glance",
	---@class GlanceOpts
	opts = {
		border = {
			enable = true,
			top_char = "―",
			bottom_char = "―",
		},
		height = 18, -- Height of the window
		zindex = 20,
		detached = true,
		theme = { -- This feature might not work properly in nvim-0.7.2
			enable = true, -- Will generate colors for the plugin based on your current colorscheme
			mode = "auto", -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
		},
		folds = {
			fold_closed = "",
			fold_open = "",
			folded = false, -- Automatically fold list on startup
		},
		winbar = {
			enable = true, -- Available strating from nvim-0.8+
		},
		indent_lines = {
			enable = true,
			icon = "│",
		},
		list = {
			position = "left", -- Position of the list window 'left'|'right'
			width = 0.2, -- 33% width relative to the active window, min 0.1, max 0.5
		},
	},
}
