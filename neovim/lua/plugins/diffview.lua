return {
	"sindrets/diffview.nvim",
	lazy = false,
	config = function(_, opts)
		local diffview = require("diffview")
		diffview.setup(opts)
	end,
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewRefresh",
		"DiffviewFileHistory",
	},
	opts = {
		view = {
			-- Configure the layout and behavior of different types of views.
			-- Available layouts:
			--  'diff1_plain'
			--    |'diff2_horizontal'
			--    |'diff2_vertical'
			--    |'diff3_horizontal'
			--    |'diff3_vertical'
			--    |'diff3_mixed'
			--    |'diff4_mixed'
			-- For more info, see ':h diffview-config-view.x.layout'.
			use_icons = true,
			default = {
				-- Config for changed files, and staged files in diff views.
				layout = "diff2_horizontal",
				winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
			},
		},
	},
}
