vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('core.path')
require('core.basic')
require('core.plugin').install({
  -- prerequisite
  {url = 'https://github.com/nvim-lua/plenary.nvim'},
  {url = 'https://github.com/kyazdani42/nvim-web-devicons'},
  -- view
  {url = 'https://github.com/mhartington/oceanic-next'},
  {url = 'https://github.com/lukas-reineke/indent-blankline.nvim'},
  {url = 'https://github.com/airblade/vim-gitgutter'},
  {url = 'https://github.com/hoob3rt/lualine.nvim'},
  {url = 'https://github.com/folke/lsp-colors.nvim'},
  -- filer
  {url = 'https://github.com/ahmedkhalf/project.nvim'},
  -- formatter
  {url = 'https://github.com/junegunn/vim-easy-align'},
  -- treesitter
  {url = 'https://github.com/nvim-treesitter/nvim-treesitter'},
  {url = 'https://github.com/p00f/nvim-ts-rainbow'},
  -- telescope
  {url = 'https://github.com/nvim-telescope/telescope.nvim'},
  -- lsp
  {url = 'https://github.com/neovim/nvim-lspconfig'},
  {url = 'https://github.com/williamboman/nvim-lsp-installer'},
  {url = 'https://github.com/hrsh7th/cmp-nvim-lsp'},
  {url = 'https://github.com/hrsh7th/cmp-buffer'},
  {url = 'https://github.com/hrsh7th/nvim-cmp'},
}, false)

require('opt.view')
require('opt.filer')
require('opt.treesitter')
require('opt.telescope')
require('opt.lsp')
require('opt.keymap')

--[[ optional
:TSUpdate maintained
:LspInstall pyright
:LspInstall sumneko_lua
:LspInstall vimls
]]

vim.api.nvim_command('lcd $HOME')

