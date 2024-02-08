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

vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]

vim.cmd.colorscheme("PaperColor") -- "rose-pine", "PaperColor", "tonyonight", "catppuccin
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
