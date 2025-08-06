return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			sort_by = "name",
			disable_netrw = true,
			view = {
				adaptive_size = false,
			},
			renderer = {
				group_empty = true,
			},
		})

		vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)
		vim.keymap.set("n", "<leader>R", vim.cmd.NvimTreeRefresh)
		vim.keymap.set("n", "<leader>ce", vim.cmd.NvimTreeClose)
	end,
}
