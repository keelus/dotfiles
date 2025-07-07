return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup{
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            mapping = {
                -- Accept suggestions
                ['<CR>'] = cmp.mapping.confirm({ select = true }),

                -- Navigate between suggestions
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" })
            },
            preselect = "item",
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" }
            }
        }
    end
}
