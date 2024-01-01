-- Command prefix
vim.g.mapleader = " "

-- Nvim-tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>R", vim.cmd.NvimTreeRefresh)
vim.keymap.set("n", "<leader>ce", vim.cmd.NvimTreeClose)

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set("n", "<leader>pg", telescope.live_grep, {})

-- Format file
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

-- Copy to system clipboard (xclip)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Toggle trouble view
vim.keymap.set("n", "<leader>tr", vim.cmd.TroubleToggle)

vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	buffer = bufnr,
	callback = function()
		vim.lsp.buf.format()
	end,
})

