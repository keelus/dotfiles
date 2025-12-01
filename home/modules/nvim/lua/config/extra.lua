vim.cmd("set encoding=utf-8")
-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50")

-- Tab size
vim.cmd("set noexpandtab")
vim.cmd("set tabstop=3")
vim.cmd("set shiftwidth=3")
vim.cmd("set softtabstop=3")

-- Tab and end of line symbols
vim.cmd("set list")
vim.cmd("set listchars=tab:›\\ ,eol:¬,trail:⋅")

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd("set relativenumber")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.opt.spelllang = "es,en"
		vim.opt_local.spell = true
	end,
})

vim.g.vimtex_view_method = "zathura"

vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

-- vim.cmd.colorscheme("melange")
vim.cmd.colorscheme("tokyonight-night")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	update_in_insert = true,
})

vim.diagnostic.config({ virtual_text = true })
vim.cmd("set signcolumn=yes")

-- vim.cmd("highlight String gui=NONE cterm=NONE")
-- vim.cmd("highlight Comment gui=NONE cterm=NONE")
