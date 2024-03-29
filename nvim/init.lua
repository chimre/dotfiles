-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set path
local helper = require('helper')
local stdout_python = helper.execute([[powershell.exe -Command "(Get-Command python).Source"]])
vim.g.python3_host_prog = stdout_python[#stdout_python]
local stdout_node = helper.execute([[powershell.exe -Command "Join-Path (Split-Path (Get-Command neovim-node-host).Source -Parent) ""node_modules\neovim\bin\cli.js"""]])
vim.g.node_host_prog = stdout_node[#stdout_node]

-- configure vanilla
vim.g.vimsyn_embed = 'lPr'

vim.api.nvim_set_option('mouse', 'a')
vim.api.nvim_command('noswapfile')
vim.api.nvim_set_option('viminfo', '')
vim.api.nvim_set_option('hidden', true)
vim.api.nvim_set_option('modeline', true)
vim.opt.display:append {'lastline'}
vim.wo.number = true
vim.wo.numberwidth = 7
vim.api.nvim_set_option('clipboard', 'unnamed')
vim.api.nvim_command('syntax enable')
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('filetype indent off')
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_set_option('shiftwidth', 2)
vim.api.nvim_set_option('softtabstop', 2)
vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('autoindent', false)
vim.api.nvim_set_option('smartindent', false)
vim.api.nvim_command('language ja_JP.UTF-8')
vim.api.nvim_set_option('encoding', 'utf-8')
vim.api.nvim_set_option('fileencoding', 'utf-8')
vim.api.nvim_set_option('fileencodings', 'ucs-boms,utf-8,euc-jp,cp932')
vim.api.nvim_set_option('fileformats', 'unix,dos,mac')
--vim.api.nvim_set_option('shell', 'cmd')
--vim.api.nvim_set_option('shellcmdflag', '/C')
vim.api.nvim_set_option('shell', 'pwsh.exe -NoLogo')
vim.api.nvim_set_option('shellcmdflag', '-Command')
--vim.api.nvim_set_option('shellquote', '\"')
vim.api.nvim_set_option('shellxquote', '')
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('incsearch', true)
vim.api.nvim_set_option('smartcase', true)
vim.api.nvim_set_option('wrapscan', true)
vim.api.nvim_set_option('whichwrap', 'b,s,h,l,<,>,[,],~')
vim.api.nvim_set_option('backspace', 'indent,eol,start')
vim.api.nvim_set_option('iminsert', 0)
vim.api.nvim_set_option('imsearch', -1)
vim.api.nvim_set_option('completeopt', 'menu,menuone,noselect')
vim.api.nvim_set_option('wildmenu', true)
vim.api.nvim_set_option('wildmode', 'list:longest')
vim.api.nvim_set_option('grepprg', 'internal')
vim.api.nvim_set_option('scrolloff', 3)
vim.api.nvim_set_option('cmdheight', 2)
vim.api.nvim_set_option('shortmess', vim.api.nvim_get_option('shortmess') .. 'Ic')
vim.api.nvim_set_option('updatetime', 300)
vim.api.nvim_set_option('signcolumn', 'yes')
vim.api.nvim_set_option('list', true)
vim.opt.listchars:append {tab = '^ ', trail = '~', eol = '$', extends = '<'}
vim.api.nvim_set_option('showcmd', true)
vim.api.nvim_set_option('showmode', true)
vim.api.nvim_set_option('laststatus', 2)
vim.opt.statusline = [[%r %<%F [%{&ff}] [%{(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'')}] %y %m %= %l / %L (%3p%%)]]

-- set auto command
vim.api.nvim_command('augroup VanillaCmd')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd FileType * set formatoptions-=ro')
vim.api.nvim_command('autocmd FileType * syntax sync fromstart')
vim.api.nvim_command('autocmd QuickFixCmdPost * set nowrap')
vim.api.nvim_command('autocmd QuickfixCmdPost * cwindow')
vim.api.nvim_command('autocmd TermOpen * startinsert')
vim.api.nvim_command('augroup END')

-- set leader
vim.g.mapleader = ' '

-- set keymap edit
vim.api.nvim_set_keymap('n', '<LEADER>c', 'J', { noremap = true, silent = true })

-- set keymap select
vim.api.nvim_set_keymap('n', 'vv', '<C-v>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'vv', '<C-v>', { noremap = true, silent = true })

-- set keymap cursor normal
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'H', '0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', '10gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '10gk', { noremap = true, silent = true })

-- set keymap cursor visual
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'H', '0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'L', '$', { noremap = true, silent = true })

-- set keymap search
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', { noremap = true, silent = true })
