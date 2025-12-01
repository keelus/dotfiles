return {
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			local lsp_signature = require("lsp_signature")
			lsp_signature.setup({
				bind = true,
				hint_prefix = "",
			})

			vim.keymap.set("n", "<C-k>", function()
				lsp_signature.toggle_float_win()
			end, { silent = true, noremap = true, desc = "toggle signature" })
		end,
	},
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"j-hui/fidget.nvim",
		},

		lazy = false,
		config = function()
			require("fidget").setup({
				progress = {
					display = {
						done_ttl = 2,
						done_icon = " ",
						done_style = "Constant",
						progress_icon = { pattern = "moon", period = 1 },
						icon_style = "Question",
					},
				},

				notification = {
					window = {
						winblend = 0,
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufmap = function(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, { buffer = args.buf })
					end

					bufmap("n", "gd", vim.lsp.buf.definition)
					bufmap("n", "K", vim.lsp.buf.hover)
					bufmap("n", "gl", vim.diagnostic.open_float)
					bufmap("n", "<leader>rf", vim.lsp.buf.references)
					bufmap("n", "<leader>rr", vim.lsp.buf.rename)
					-- bufmap("n", "<leader>vca", vim.lsp.buf.code_action)
					bufmap("i", "<C-h>", vim.lsp.buf.signature_help)
					bufmap("i", "<C-Space>", vim.lsp.buf.signature_help)
				end,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.enable("clangd")
			vim.lsp.config("clangd", {
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "clangd" },
			})

			vim.lsp.enable("rust_analyzer")
			vim.lsp.config("rust_analyzer", {
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "rust-analyzer" },
				filetypes = { "rust" },
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						check = {
							command = "clippy",
						},
						diagnostics = {
							enable = true,
							enableExperimental = true,
						},
						checkOnSave = true,
					},
				},
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					},
				},
			})

			vim.lsp.enable("tsserver")
			vim.lsp.config("tsserver", {
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
				cmd = { "typescript-language-server", "--stdio" },
			})

			vim.lsp.enable("basedpyright")
			vim.lsp.config("basedpyright", {
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "basedpyright-langserver", "--stdio" },
			})

			vim.lsp.enable("nixd")
			vim.lsp.config("nixd", {
				capabilities = capabilities,
			})

			vim.lsp.enable("qmlls")
			vim.lsp.config("qmlls", {
				capabilities = capabilities,
				cmd = { "qmlls", "-E" },
				filetypes = { "qml", "qtquick" },
			})

			vim.lsp.enable("html")
			vim.lsp.config("html", {
				capabilities = capabilities,
				filetypes = { "html" },
				cmd = { "vscode-html-language-server", "--stdio" },
			})
			vim.lsp.enable("css")
			vim.lsp.config("css", {
				capabilities = capabilities,
				filetypes = { "css" },
				cmd = { "vscode-css-language-server", "--stdio" },
			})
		end,
	},
}
