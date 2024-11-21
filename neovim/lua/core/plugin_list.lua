return {
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "Th3Whit3Wolf/one-nvim" },
	"folke/tokyonight.nvim",
	"sainnhe/sonokai",
	{ "rose-pine/neovim", name = "rose-pine" },
	"marko-cerovac/material.nvim",
	"navarasu/onedark.nvim",
	"EdenEast/nightfox.nvim",
	"rmehri01/onenord.nvim",
	"olimorris/onedarkpro.nvim",
	"cpea2506/one_monokai.nvim",
	"xiyaowong/transparent.nvim",

	"nvim-lua/plenary.nvim",
	"bluz71/vim-nightfly-guicolors",
	"nanotech/jellybeans.vim",
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",
	"numToStr/Comment.nvim",
	"nvim-lualine/lualine.nvim",
	{ "akinsho/toggleterm.nvim", version = "*", opts = {} },

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		keys = function()
			return {
				{ "<leader>*", "<cmd>Telescope grep_string<cr>", { silent = true, desc = "Grep Word Under Cursor" } },
			}
		end,
		version = "0.1.x",

		dependencies = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},

	"ThePrimeagen/git-worktree.nvim",
	"tpope/vim-fugitive",

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- managing & installing lsp servers
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- configuring lsp servers
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	{ "glepnir/lspsaga.nvim", version = "main" },
	"onsails/lspkind.nvim",

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/playground",
	"nvim-treesitter/nvim-treesitter-context",

	"HiPhish/nvim-ts-rainbow2",

	"mbbill/undotree",

	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	"lewis6991/gitsigns.nvim",

	"RRethy/vim-illuminate",

	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	"ThePrimeagen/harpoon",

	{
		"phaazon/hop.nvim",
		version = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},

	-- which key
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	"folke/trouble.nvim",
	"f-person/git-blame.nvim",
	"nvim-pack/nvim-spectre",
	"dnlhc/glance.nvim",
	"kevinhwang91/nvim-bqf",
	"preservim/tagbar",
	"almo7aya/openingh.nvim",
	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},
	"Mofiqul/dracula.nvim",
	"max397574/better-escape.nvim",
	{
		"lmburns/lf.nvim",
		config = function()
			-- This feature will not work if the plugin is lazy-loaded
			vim.g.lf_netrw = 1
			require("lf").setup({
				escape_quit = false,
				border = "rounded",
			})
			vim.keymap.set("n", "<M-o>", "<Cmd>Lf<CR>")
		end,
		dependencies = { "toggleterm.nvim" },
	},
	"andythigpen/nvim-coverage",
	{
		{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

		--- Uncomment these if you want to manage LSP servers from neovim
		-- {'williamboman/mason.nvim'},
		-- {'williamboman/mason-lspconfig.nvim'},

		-- LSP Support
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
			},
		},

		-- Autocompletion
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				{ "L3MON4D3/LuaSnip" },
			},
		},
	},
}
