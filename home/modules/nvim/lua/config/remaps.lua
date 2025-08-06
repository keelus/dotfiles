-- Command prefix
vim.g.mapleader = " "

-- Format file
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

-- Copy to system clipboard (xclip)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Movement between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
