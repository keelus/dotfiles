local noirbuddy_lualine = require('noirbuddy.plugins.lualine')

require('lualine').setup {
  options = {
    theme = noirbuddy_lualine.theme,
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = noirbuddy_lualine.sections,
  inactive_sections = noirbuddy_lualine.inactive_sections,
}
