require("keelus.remap")
vim.cmd('set encoding=utf-8')
-- Disable netrw 
vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

-- Tab size
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')

-- Tab and end of line symbols
vim.cmd('set list')
vim.cmd('set listchars=tab:›\\ ,eol:¬,trail:⋅')

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd('set relativenumber')
