local cmp = require('cmp')
cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
		-- Accept suggestions
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

		-- Navigate between suggestions
		['<Up>'] = cmp.mapping.select_prev_item(),
		['<Down>'] = cmp.mapping.select_next_item(),
		['<Esc>'] = cmp.mapping.abort(),
		
		-- Function snippet moving
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }
})
