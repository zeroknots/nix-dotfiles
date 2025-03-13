return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		require("tokyonight").setup(opts)
	end,
	opts = {
		style = "night",
		-- disable italic for functions
		styles = {
			functions = {},
			comments = { italic = true },
			keywords = { italic = true },
			sidebars = "dark", -- style for sidebars, see below
		},
		sidebars = { "qf", "vista_kind", "terminal", "packer" },
		hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
		-- Change the "hint" color to the "orange" color, and make the "error" color bright red
		on_colors = function(colors)
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"
			-- colors.hint = colors.white
			colors.error = "#ff0000"
			colors.magenta = "#ff757f"
			colors.purple = "#ff757f"
			colors.magenta2 = "#ff757f"
			colors.yellow = "#c8d3f5"
			colors.blue1 = colors.cyan
			-- colors.blue = "#9d7cd8" // function definition and interfaces
			-- colors.blue = "#9d7cd8"
			colors.bg = bg
			colors.bg_dark = bg_dark
			colors.bg_float = bg_dark
			colors.bg_highlight = bg_highlight
			colors.bg_popup = bg_dark
			colors.bg_search = bg_search
			colors.bg_sidebar = bg_dark
			colors.bg_statusline = bg_dark
			colors.bg_visual = bg_visual
			colors.border = border
			colors.fg = fg
			colors.fg_dark = fg_dark
			colors.fg_float = fg
			colors.fg_gutter = fg_gutter
			colors.fg_sidebar = fg_dark
		end,
		on_highlights = function(highlights, colors)
			highlights.String = { fg = "#ffc777" }
			highlights.PreProc = { fg = colors.red }
			-- highlights.Function = { fg = colors.green }

			highlights.Type = { fg = colors.green1 }
			-- highlights.Keyword = { fg = colors.red }
			highlights.Identifier = { fg = colors.orange }
		end,
	},
}

-- {
--   "folke/tokyonight.nvim",
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     local bg = "#011628"
--     local bg_dark = "#011423"
--     local bg_highlight = "#143652"
--     local bg_search = "#0A64AC"
--     local bg_visual = "#275378"
--     local fg = "#CBE0F0"
--     local fg_dark = "#B4D0E9"
--     local fg_gutter = "#627E97"
--     local border = "#547998"
--
--     require("tokyonight").setup({
--       style = "night",
--       on_colors = function(colors)
--         colors.bg = bg
--         colors.bg_dark = bg_dark
--         colors.bg_float = bg_dark
--         colors.bg_highlight = bg_highlight
--         colors.bg_popup = bg_dark
--         colors.bg_search = bg_search
--         colors.bg_sidebar = bg_dark
--         colors.bg_statusline = bg_dark
--         colors.bg_visual = bg_visual
--         colors.border = border
--         colors.fg = fg
--         colors.fg_dark = fg_dark
--         colors.fg_float = fg
--         colors.fg_gutter = fg_gutter
--         colors.fg_sidebar = fg_dark
--       end,
--     })
--     -- load the colorscheme here
--     vim.cmd([[colorscheme tokyonight]])
--   end,
-- },
