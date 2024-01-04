local lsp_zero = require('lsp-zero')


lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		"gopls"
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

require("lspconfig").gopls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = false,
			analyses = {
				unusedparams = true,
				nilness = true,
				shadow = true,
				unusedvariable = true,
				unusedwrite = true
			},
		},
	},
}

-- Remove imported and unused libraries (code from "https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-1801096383")
local golang_organize_imports = function(bufnr, isPreflight)
	local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding(bufnr))
	params.context = { only = { "source.organizeImports" } }

	if isPreflight then
		vim.lsp.buf_request(bufnr, "textDocument/codeAction", params, function() end)
		return
	end

	local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 3000)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding(bufnr))
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspFormatting", {}),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client.name == "gopls" then
			-- hack: Preflight async request to gopls, which can prevent blocking when save buffer on first time opened
			golang_organize_imports(bufnr, true)

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				group = vim.api.nvim_create_augroup("LspGolangOrganizeImports." .. bufnr, {}),
				callback = function()
					golang_organize_imports(bufnr)
				end,
			})
		end
	end,
})


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
	-- delay update diagnostics
	update_in_insert = true,
}
)
