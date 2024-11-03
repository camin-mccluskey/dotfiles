return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	opts = {
		-- copilot-cmp will handle this
		suggestion = { enabled = false },
		panel = { enabled = false },
		filetypes = {
			markdown = true,
			help = true,
		},
	},
}
