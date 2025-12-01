return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			color_overrides = {
				mocha = {
					base = "#000000",
				},
			},
			integrations = {
				nvimtree = true,
				telescope = true,
				treesitter = true,
				lsp_trouble = true,
			},
			highlight_overrides = {
				mocha = function(mocha)
					return {
						NvimTreeNormal = { bg = mocha.none },
					}
				end,
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
