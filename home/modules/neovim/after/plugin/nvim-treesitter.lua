require('nvim-treesitter.configs').setup({
  auto_install = true,
  ensure_installed = {
    'lua',
    'astro',
    'typescript',
    'javascript',
    'tsx',
    'html',
  },
  highlight = {
    enable = true,
  },
  textsubjects = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
