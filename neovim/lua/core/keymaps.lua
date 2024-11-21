-- set leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

-- Move the highlighted text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Append line below to the current line, the cursor stays at the front
keymap.set("n", "J", "mzJ`z")

-- Half-page jumps, cursos stays in the center
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "x", '"_x')

-- splits
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>|", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>-", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
keymap.set("n", "<leader>ss", ":lua require('spectre').open()<CR>")
keymap.set("n", "<leader>sw", ":lua require('spectre').open_visual({select_word=true})<CR>")

-- jumps
keymap.set("n", "[j", "<C-o>")
keymap.set("n", "]j", "<C-i>")

-- terminal
keymap.set("n", "<leader>tt", ":ToggleTerm<CR>")

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- git
keymap.set("n", "<leader>gl", ":LazyGit<CR>")
keymap.set("n", "gu", "<cmd>diffget //2<CR>") -- get the upper version of the diff
keymap.set("n", "gh", "<cmd>diffget //3<CR>") -- get the lower version of the diff
keymap.set("n", "<leader>gwc", ":Telescope git_worktree create_git_worktree <CR>") -- get the lower version of the diff
keymap.set("n", "<leader>gww", ":Telescope git_worktree git_worktrees <CR>") -- get the lower version of the diff

keymap.set("n", "]g", ":lua require('gitsigns').next_hunk()<CR>")
keymap.set("n", "[g", ":lua require('gitsigns').prev_hunk()<CR>")
keymap.set("n", "<leader>gs", ":lua require('gitsigns').stage_hunk()<CR>")

keymap.set("n", "gD", ":Glance definitions<CR>")
keymap.set("n", "gR", ":Glance references<CR>")
keymap.set("n", "gI", ":Glance implementations<CR>")
keymap.set("n", "gT", ":Glance type_definitions<CR>")

keymap.set("n", "<leader>dd", ":TroubleToggle<CR>")
keymap.set("n", "<leader>ddw", ":TroubleToggle workspace_diagnostics<CR>")
keymap.set("n", "<leader>ddf", ":TroubleToggle quickfix<CR>")

-- restart lsp server
-- keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>") -- mapping to restart lsp if necessary

-- solidity dev env
keymap.set("n", "<leader>fmt", ":!pnpm -r fmt; forge fmt<CR>")
keymap.set("n", "<leader>cf", ":!forge fmt<CR>")
keymap.set("n", "<leader> ", ":HopWord<CR>")

-- tree sitter
keymap.set("n", "<leader>ts", ":TSEnable highlight<CR>")
