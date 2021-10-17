vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('core.path')
require('core.vanilla')
require('core.plugin').install({
  -- prerequisite
  {url = 'https://github.com/nvim-lua/plenary.nvim'},
  {url = 'https://github.com/kyazdani42/nvim-web-devicons'},
  -- parser
  {url = 'https://github.com/nvim-treesitter/nvim-treesitter'},
  {url = 'https://github.com/p00f/nvim-ts-rainbow'},
  {url = 'https://github.com/neovim/nvim-lspconfig'},
  {url = 'https://github.com/williamboman/nvim-lsp-installer'},
  {url = 'https://github.com/hrsh7th/cmp-nvim-lsp'},
  {url = 'https://github.com/hrsh7th/cmp-buffer'},
  {url = 'https://github.com/hrsh7th/nvim-cmp'},
  -- formatter
  {url = 'https://github.com/junegunn/vim-easy-align'},
  -- view
  {url = 'https://github.com/mhartington/oceanic-next'},
  {url = 'https://github.com/lukas-reineke/indent-blankline.nvim'},
  {url = 'https://github.com/lewis6991/gitsigns.nvim'},
  {url = 'https://github.com/hoob3rt/lualine.nvim'},
  {url = 'https://github.com/folke/lsp-colors.nvim'},
  -- finder
  {url = 'https://github.com/ahmedkhalf/project.nvim'},
  {url = 'https://github.com/nvim-telescope/telescope.nvim'},
}, false)

require('opt.parser')
require('opt.formatter')
require('opt.view')
require('opt.finder')
require('opt.keymap')

--[[ optional
:TSUpdate maintained
:LspInstall pyright
:LspInstall sumneko_lua
:LspInstall vimls
]]

vim.api.nvim_command('lcd $HOME')

