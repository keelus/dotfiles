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
-- vim.keymap.set("n", "<leader>tr", vim.cmd.TroubleToggle)
vim.keymap.set("n", "<leader>tr", function()
	require("trouble").toggle("diagnostics")
end, {})
vim.keymap.set("n", "<C-t>", vim.diagnostic.open_float)

vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	buffer = bufnr,
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- Paste without losing clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")
-- Delete without losing clipboard
vim.keymap.set({"n","v"}, "<leader>d", "\"_d")

vim.keymap.set("n", "<C-Tab>", vim.lsp.buf.hover)


-- Disable arrows, home, end, pgup and pgdown keys, to gain muscle memory
vim.keymap.set({"", "!"}, '<Up>', '<Nop>')
vim.keymap.set({"", "!"}, '<Down>', '<Nop>')
vim.keymap.set({"", "!"}, '<Left>', '<Nop>')
vim.keymap.set({"", "!"}, '<Right>', '<Nop>')
vim.keymap.set({"", "!"}, '<C-Up>', '<Nop>')
vim.keymap.set({"", "!"}, '<C-Down>', '<Nop>')
vim.keymap.set({"", "!"}, '<C-Left>', '<Nop>')
vim.keymap.set({"", "!"}, '<C-Right>', '<Nop>')
vim.keymap.set({"", "!"}, '<PageUp>', '<Nop>')
vim.keymap.set({"", "!"}, '<PageDown>', '<Nop>')
vim.keymap.set({"", "!"}, '<C-PageUp>', '<Nop>')
vim.keymap.set({"", "!"}, '<C-PageDown>', '<Nop>')
vim.keymap.set({"", "!"}, '<Home>', '<Nop>')
vim.keymap.set({"", "!"}, '<End>', '<Nop>')
vim.keymap.set({"", "!"}, '<C-Home>', '<Nop>')
vim.keymap.set({"", "!"}, '<C-End>', '<Nop>')
vim.keymap.set({"", "!"}, '<S-Home>', '<Nop>')
vim.keymap.set({"", "!"}, '<S-End>', '<Nop>')
