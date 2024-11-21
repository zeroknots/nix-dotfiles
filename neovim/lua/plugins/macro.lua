return {
	"chrisgrieser/nvim-recorder",
	dependencies = "rcarriga/nvim-notify", -- optional
	config = function(_, opts)
		require("recorder").setup(opts)
	end,
	opts = {

		slots = { "a", "s", "d" },

		mapping = {
			startStopRecording = "q",
			playMacro = "Q",
			switchSlot = "<C-q>",
			editMacro = "cq",
			deleteAllMacros = "dq",
			yankMacro = "yq",
			-- ⚠️ this should be a string you don't use in insert mode during a macro
			addBreakPoint = "##",
		},
	}, -- required even with default settings, since it calls `setup(
}
