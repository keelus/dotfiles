require("catppuccin").setup {
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
		lsp_trouble = true
    },
    highlight_overrides = {
        mocha = function(mocha)
            return {
                NvimTreeNormal = { bg = mocha.none },
            }
        end,
    },
}
 
require('noirbuddy').setup {
  colors = {
    primary = '#79a1f6',
    secondary = '#4e6596',
  },
}

require("darkrose").setup({
	styles = {
	    bold = true,
	    italic = true,
	    underline = true,
	}
})

vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]

vim.cmd.colorscheme("tokyonight-night") -- "rose-pine", "PaperColor", "tonyonight", "catppuccin", "oxocarbon", "darkrose"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
