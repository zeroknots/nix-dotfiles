return {
	"ThePrimeagen/git-worktree.nvim",
	config = function(_, opts)
		local Worktree = require("git-worktree")
		Worktree.setup(opts)

		Worktree.on_tree_change(function(op, metadata)
			if op == Worktree.Operations.Switch then
				os.execute("t " .. metadata.path)
			end
		end)
	end,

	opts = {

		keys = {
			{
				"<leader>gw",
				"<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
				desc = "git worktree",
			},

			{
				"<leader>gwc",
				"<cmd>:lua require('telescope').extensions.git_worktree.create_git_worktrees()<cr>",
				desc = "git worktree",
			},
		},
	},
}
