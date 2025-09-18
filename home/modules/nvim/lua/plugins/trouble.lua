return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({})

		vim.keymap.set("n", "<leader>tr", function()
			require("trouble").toggle("diagnostics")
		end, {})
		vim.keymap.set("n", "<C-t>", vim.diagnostic.open_float)
	end,
}
