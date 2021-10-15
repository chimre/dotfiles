require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    ensure_installed = "maintained",
    additional_vim_regex_highlighting = false,
    disable = {}
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

