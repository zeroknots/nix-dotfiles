return {
	{
		"saghen/blink.cmp",
		enabled = true,
		event = { "InsertEnter", "CmdlineEnter" },
		version = "*",
		dependencies = {
			{
				"giuxtaposition/blink-cmp-copilot",
			},
			{
				"saghen/blink.compat",
				event = { "InsertEnter", "CmdlineEnter" },
				opts = {},
			},
			{
				"L3MON4D3/LuaSnip",
				cmd = { "LuaSnip" },
				event = "InsertEnter",
				build = "make install_jsregexp",
				config = function()
					local luasnip = require("luasnip")
					local types = require("luasnip.util.types")

					-- luasnip.cleanup()

					luasnip.setup({
						-- -- This tells LuaSnip to remember to keep around the last snippet.
						-- -- You can jump back into it even if you move outside of the selection
						keep_roots = true,
						link_roots = false,
						link_children = true,
						--
						-- -- This one is cool cause if you have dynamic snippets, it updates as you type!
						update_events = "TextChanged,TextChangedI",
						enable_autosnippets = true,

						-- region_check_events = "CursorHold,InsertLeave",
						delete_check_events = "TextChanged",

						ext_opts = {
							[types.choiceNode] = {
								active = { hl_group = "Error", virt_text = { { "●", "Error" } } },
							},
							[types.insertNode] = {
								active = { hl_group = "Error", virt_text = { { "●", "Error" } } },
							},
							[types.snippetNode] = {
								active = { hl_group = "Error", virt_text = { { "●", "Error" } } },
							},
						},
					})

					luasnip.filetype_extend("typescriptreact", { "typescript" })

					--require("luasnip.loaders.from_vscode").load_standalone({
					--path = "~/.config/nvim/lua/dlvhdr/snippets/markdown.json",
					--})

					require("luasnip.loaders.from_lua").load({
						paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
					})
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			-- "onsails/lspkind-nvim",
			-- "zbirenbaum/copilot.lua",
			-- "zbirenbaum/copilot-cmp",
		},

		opts = function(_, opts)
			opts.appearance = {
				-- sets the fallback highlight groups to nvim-cmp's highlight groups
				-- useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release, assuming themes add support
				use_nvim_cmp_as_default = false,
				-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			}

			opts.signature = {
				enabled = true,
			}

			opts.snippets = {
				preset = "luasnip",
				-- This comes from the luasnip extra, if you don't add it, won't be able to
				-- jump forward or backward in luasnip snippets
				-- https://www.lazyvim.org/extras/coding/luasnip#blinkcmp-optional
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			}

			opts.completion = {
				-- list.selection = {preselect = true, auto_insert = false},
				accept = {
					-- experimental auto-brackets support
					auto_brackets = {
						enabled = true,
					},
				},
				list = {
					-- Maximum number of items to display
					max_items = 200,

					selection = {
						-- When `true`, will automatically select the first item in the completion list
						--preselect = false,
						preselect = function(ctx)
							return ctx.mode ~= "cmdline"
						end,

						-- When `true`, inserts the completion item automatically when selecting it
						-- You may want to bind a key to the `cancel` command (default <C-e>) when using this option,
						-- which will both undo the selection and hide the completion menu
						auto_insert = false,
						-- auto_insert = function(ctx) return ctx.mode ~= 'cmdline' end
					},

					cycle = {
						-- When `true`, calling `select_next` at the *bottom* of the completion list
						-- will select the *first* completion item.
						from_bottom = true,
						-- When `true`, calling `select_prev` at the *top* of the completion list
						-- will select the *last* completion item.
						from_top = true,
					},
				},

				menu = {
					border = "rounded",
					draw = {
						gap = 2,
						columns = {
							{ "kind_icon", gap = 1 },
							{ "label", "label_description", gap = 1 },
							{ "source_name", gap = 1 },
						},
						components = {
							source_name = {
								text = function(ctx)
									return "[" .. ctx.source_name .. "]"
								end,
							},
							kind_icon = {
								text = function(ctx)
									if
										require("blink.cmp.completion.windows.render.tailwind").get_hex_color(ctx.item)
									then
										return "󱓻"
									end
									local client = vim.lsp.get_client_by_id(ctx.item.client_id)
									if client and client.name == "tailwindcss" then
										return "󱏿"
									end
									return ctx.kind_icon .. ctx.icon_gap
								end,
							},
						},
					},
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
				},
				documentation = {
					window = {
						border = "rounded",
						winblend = 0,
					},
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				ghost_text = {
					enabled = vim.g.ai_cmp,
				},
			}

			-- opts.completion.list.selection = { preselect = true, auto_insert = false }
			opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					lsp = {
						name = "lsp",
						enabled = true,
						module = "blink.cmp.sources.lsp",
						score_offset = 90, -- the higher the number, the higher the priority
					},
					path = {
						name = "Path",
						module = "blink.cmp.sources.path",
						score_offset = 3,
						-- When typing a path, I would get snippets and text in the
						-- suggestions, I want those to show only if there are no path
						-- suggestions
						fallbacks = { "snippets", "buffer" },
						opts = {
							trailing_slash = false,
							label_trailing_slash = true,
							get_cwd = function(context)
								return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
							end,
							show_hidden_files_by_default = true,
						},
					},
					buffer = {
						name = "Buffer",
						enabled = true,
						max_items = 4,
						module = "blink.cmp.sources.buffer",
						min_keyword_length = 2, -- setting this to 3 cause blink popping up at :w drives me nuts
					},
					snippets = {
						name = "snippets",
						enabled = true,
						max_items = 8,
						min_keyword_length = 2,
						-- module = "blink.cmp.sources.snippets",
						score_offset = 80,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100, -- show at a higher priority than lsp
					},
				},
				-- command line completion, thanks to dpetka2001 in reddit
				-- https://www.reddit.com/r/neovim/comments/1hjjf21/comment/m37fe4d/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
				cmdline = function()
					local type = vim.fn.getcmdtype()
					if type == "/" or type == "?" then
						return { "buffer" }
					end
					if type == ":" then
						return { "cmdline" }
					end
					return {}
				end,
			})

			opts.keymap = {
				preset = "default",

				-- ["<CR>"] = { "select_and_accept", "fallback" },
				["<C-l>"] = { "select_and_accept", "fallback" },
				["<C-space>"] = { "select_and_accept", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				--["<C-l>"] = { "snippet_forward", "fallback" },
				--["<C-h>"] = { "snippet_backward", "fallback" },

				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<C-s>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<Tab>"] = {},
				["<S-Tab>"] = {},
			}

			return opts
		end,
	},
}
