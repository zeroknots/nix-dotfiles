return {
	"xiyaowong/transparent.nvim",
	config = function(_, opts)
		local transparent = require("transparent")
		transparent.setup(opts)
	end,
	opts = {
		groups = { -- table: default groups
			"Normal",
			"NormalNC",
			"NormalFloat",
			"Comment",
			"Constant",
			"Special",
			"Identifier",
			"Statement",
			"PreProc",
			"Type",
			"Underlined",
			"Todo",
			"String",
			"Function",
			"Conditional",
			"Repeat",
			"Operator",
			"Structure",
			"LineNr",
			"NonText",
			"SignColumn",
			"CursorLineNr",
			"EndOfBuffer",
		},
		extra_groups = { "NormalFloat" }, -- table: additional groups that should be cleared
		exclude_groups = {}, -- table: groups you don't want to clear
	},
}
