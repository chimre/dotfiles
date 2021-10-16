vim.opt.termguicolors = true

vim.g.oceanic_next_terminal_bold = 0
vim.g.oceanic_next_terminal_italic = 0
vim.api.nvim_command('colorscheme OceanicNext')

require('indent_blankline').setup {
  show_current_context = true,
}

--vim.opt.statusline = [[%r %<%F [%{&ff}] [%{(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'')}] %y %m %= %l / %L (%3p%%)]]
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'everforest',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', file_status = true, path = 1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

