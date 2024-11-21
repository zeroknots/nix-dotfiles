local icons = require("core.icons")
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function(_, opts)
		local neotree = require("neo-tree")
		neotree.setup(opts)
	end,
	lazy = false,
	opts = {
		source_selector = {
			winbar = false,
			statusline = false,
		},
		filesystem = {
			filtered_items = {
				always_show = {
					"node_modules",
				},
			},
		},

		enable_git_status = true,
		default_component_configs = {
			container = {
				enable_character_fade = true,
			},
			indent = {
				indent_size = 2,
				padding = 1, -- extra padding on left hand side
				-- indent guides
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				-- expander config, needed for nesting files
				with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "ﰊ",
				-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
				-- then these will never be used.
				default = "*",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "[+]",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {
					-- Change type
					added = icons.git.added, -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = icons.git.changed, -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = icons.git.deleted, -- this can only be used in the git_status source
					renamed = "", -- this can only be used in the git_status source
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
		},
		window = {
			position = "right",
			width = 30,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
		},
	},
	keys = {
		{ "<leader>fs", "<cmd>Neotree<cr>", { silent = true, desc = "Neotree Toggle" } },
		{
			"\\",
			"<cmd>Neotree toggle reveal_force_cwd<cr>",
			{ silent = true, desc = "Neotree Toggle reveal_force_cwd" },
		},
		{ "<leader>\\b", "<cmd>Neotree source=buffers toggle<cr>", { silent = true, desc = "Neotree buffers toggle" } },
		{
			"<leader>\\g",
			"<cmd>Neotree source=git_status toggle<cr>",
			{ silent = true, desc = "Neotree git status toggle" },
		},
	},
}
