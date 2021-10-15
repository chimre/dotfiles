local helper = require('helper')

vim.g.home = os.getenv('HOME')
vim.g.home_cache = os.getenv('HOME_CACHE')
vim.g.home_config = os.getenv('HOME_CONFIG')
vim.g.home_repos = os.getenv('HOME_REPOS')

vim.g.vim_vimrc = vim.g.home .. '\\_vimrc'
vim.g.vim_cache = vim.g.home_cache .. '\\vim'
vim.g.vim_config = vim.g.home_config .. '\\vim'
vim.g.vim_ftplugin = vim.g.home_config .. '\\ftplugin'

if string.find(vim.api.nvim_get_option('packpath'), vim.g.vim_cache) == nil then
  vim.api.nvim_set_option('packpath', vim.api.nvim_get_option('packpath') .. ',' .. vim.g.vim_cache)
end

local stdout = helper.execute('powershell.exe -Command "(Get-Command python).Source"')
vim.g.python3_host_prog = stdout[#stdout]

stdout = helper.execute('powershell.exe -Command "Join-Path (Split-Path (Get-Command neovim-node-host).Source -Parent) ""node_modules\\neovim\\bin\\cli.js"""')
vim.g.node_host_prog = stdout[#stdout]

