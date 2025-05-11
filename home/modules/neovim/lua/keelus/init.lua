require("keelus.remap")
vim.cmd('set encoding=utf-8')
-- Disable netrw 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50')

vim.lsp.set_log_level("debug")


-- Tab size
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')

-- Tab and end of line symbols
vim.cmd('set list')
vim.cmd('set listchars=tab:›\\ ,eol:¬,trail:⋅')

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd('set relativenumber')

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.opt.spelllang = "es,en"
		vim.opt_local.spell = true
	end,
})

vim.g.vimtex_view_method = "zathura"
