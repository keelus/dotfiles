return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
	},
	config = function()
		local telescope = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pg", telescope.live_grep, {})
		vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
	end,
}
