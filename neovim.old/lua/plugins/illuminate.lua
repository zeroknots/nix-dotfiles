return {
	"RRethy/vim-illuminate",
	lazy = false,
	config = function(_, opts)
		local plugin = require("illuminate")
		plugin.configure(opts)
	end,

	opts = {
		-- providers: provider used to get references in the buffer, ordered by priority
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
		-- delay: delay in milliseconds
		delay = 100,
		-- filetype_overrides: filetype specific overrides.
		-- The keys are strings to represent the filetype while the values are tables that
		-- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
		filetype_overrides = {},
		-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
		filetypes_denylist = {
			"dirvish",
			"fugitive",
		},
	},
}
