return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 2000,
	---@class CatppuccinOptions
	opts = function()
		-- TODO: generate dynamics colors
		local theme_colors = require("config.colors")
		return {
			-- flavour = "mocha",
			transparent_background = true,
			color_overrides = { all = theme_colors },
			custom_highlights = function(colors)
				return {
					CurSearch = { bg = colors.yellow },
					GitSignsChange = { fg = colors.blue },

					-- solidity
					["@keyword"] = { fg = colors.red, style = { "italic" } },
					["@keyword.directive"] = { fg = colors.red, style = { "italic" } },
					["@keyword.type"] = { fg = colors.red, style = { "italic", "bold" } },
					["@keyword.modifier"] = { fg = colors.red, style = { "italic" } },
					["@keyword.return"] = { fg = colors.red, style = { "italic" } },
					["@keyword.function"] = { fg = colors.flamingo, style = { "italic" } },
					["@keyword.import"] = { fg = colors.flamingo, style = { "italic" } },
					["@number"] = { fg = colors.lavender },
					["@keyword.operator"] = { fg = colors.red },
					["@keyword.repeat"] = { fg = colors.red, style = { "italic" } },
					["@keyword.conditional"] = { fg = colors.red, style = { "italic" } },
					["@type.builtin"] = { fg = colors.blue, style = { "italic" } },
					["@type"] = { fg = colors.blue },
					["@operator"] = { fg = colors.red },
					["@variable.member"] = { fg = colors.peach },
					["@variable.parameter"] = { fg = colors.text },
					["@variable"] = { fg = colors.text },
					["@constructor"] = { fg = colors.green },
					["@function"] = { fg = colors.green },
					["@function.call"] = { fg = colors.green, style = { "italic" } },
					["@function.builtin"] = { fg = colors.green },
					["@function.method.call"] = { fg = colors.green, style = { "italic" } },
					["@string"] = { fg = colors.yellow },
					["@string.special.path"] = { fg = colors.lavender },
					["@punctuation.bracket"] = { fg = colors.subtext1 },
					--
				}
			end,
			integrations = {
				cmp = true,
				copilot_vim = true,
				fidget = true,
				gitsigns = true,
				harpoon = true,
				lsp_trouble = true,
				mason = true,
				neotest = true,
				noice = true,
				notify = true,
				octo = true,
				telescope = {
					enabled = true,
				},
				treesitter = true,
				treesitter_context = false,
				symbols_outline = true,
				illuminate = true,
				which_key = true,
				barbecue = {
					dim_dirname = true,
					bold_basename = true,
					dim_context = false,
					alt_background = false,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
			},
		}
	end,
}
