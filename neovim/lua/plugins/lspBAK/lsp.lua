local lsp = require("lsp-zero").preset({ "recommended" })

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"rust_analyzer",
})

lsp.use("solidity", {
	cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
	filetypes = { "solidity" },
	root_dir = require("lspconfig.util").find_git_ancestor,
	single_file_support = true,
})

lsp.configure("solidity", {
	settings = {
		solidity = {
			includePath = "",
			remapping = {
				["forge-std/"] = "lib/forge-std/src/",
				["foundry-huff/"] = "lib/foundry-huff/src/",
				["solady/"] = "lib/solady/src/",
				["solmate/"] = "lib/solmate/src/",
				["zodiac/"] = "lib/zodiac/contract/",
				["safe-tools/"] = "lib/safe-tools/src/",
				["@openzeppelin/"] = "lib/openzeppelin-contracts/",
				["@eas/"] = "lib/eas-contracts/contracts/",
				["openzeppelin-contracts/"] = "lib/openzeppelin-contracts",
				["hashi/"] = "lib/hashi/packages/evm/contracts/",
			},
		},
	},
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- Autocompletion settings
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	-- vim.keymap.set("n", "<leader>vws", function()
	-- 	vim.lsp.buf.workspace_symbol()
	-- end, opts)
	-- vim.keymap.set("n", "<leader>vd", function()
	-- 	vim.diagnostic.open_float()
	-- end, opts)
	-- vim.keymap.set("n", "[d", function()
	-- 	vim.diagnostic.goto_next()
	-- end, opts)
	-- vim.keymap.set("n", "]d", function()
	-- 	vim.diagnostic.goto_prev()
	-- end, opts)
	-- vim.keymap.set("n", "<leader>vca", function()
	-- 	vim.lsp.buf.code_action()
	-- end, opts)
	-- vim.keymap.set("n", "<leader>vrr", function()
	-- 	vim.lsp.buf.references()
	-- end, opts)
	-- vim.keymap.set("n", "<leader>vrn", function()
	-- 	vim.lsp.buf.rename()
	-- end, opts)
	-- vim.keymap.set("i", "<C-h>", function()
	-- 	vim.lsp.buf.signature_help()
	-- end, opts)

	vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
	-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
	vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	-- vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action <CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "<leader>o", "<cmd>LspoutlineToggle<CR>", opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
