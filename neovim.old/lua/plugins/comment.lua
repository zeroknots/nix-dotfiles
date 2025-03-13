return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- event = {
	-- 	"BufReadPre",
	-- 	"BufNewFile",
	-- },
	opts = {
		enable = true,
		enable_autocmd = false,
	},
	{
		"echasnovski/mini.comment",
		-- event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return "// %s"
					-- return require("ts_context_commentstring.internal").calculate_commentstring()
					-- 	or vim.bo.commentstring
				end,
			},
		},
	},
}
