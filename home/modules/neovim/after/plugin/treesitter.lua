require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "c", "lua", "vim", "vimdoc", "query", "markdown", "json", "html", "css", "scss", "javascript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
