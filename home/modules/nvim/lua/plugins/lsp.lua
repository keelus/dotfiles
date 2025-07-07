return {
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = function()
            local lsp_signature = require("lsp_signature")
            lsp_signature.setup{
                bind = true,
                hint_prefix = ""
            }

            vim.keymap.set("n", '<C-k>', function()
                lsp_signature.toggle_float_win()
            end, { silent = true, noremap = true, desc = 'toggle signature' })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()


            vim.keymap.set("n", "<C-Tab>", vim.lsp.buf.hover)

            lspconfig.clangd.setup{
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "clangd" }
            }

            lspconfig.rust_analyzer.setup{
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "rust-analyzer" },
                root_dir = require("lspconfig").util.root_pattern("Cargo.toml", "rust-project.json"),
                filetypes = { "rust" },
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                        checkOnSave = true,
                    }
                }
            }
        end
    }
}
