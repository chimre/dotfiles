vim.g.mapleader = ' '

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

vim.api.nvim_command('augroup VanillaCmd')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd FileType * set formatoptions-=ro')
vim.api.nvim_command('autocmd FileType * syntax sync fromstart')
vim.api.nvim_command('autocmd QuickFixCmdPost * set nowrap')
vim.api.nvim_command('autocmd QuickfixCmdPost * cwindow')
vim.api.nvim_command('autocmd TermOpen * startinsert')
vim.api.nvim_command('augroup END')

vim.api.nvim_set_keymap('n', '<A-e>v', 'Y:<C-r>*<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<A-e>l', 'Y:lua <C-r>*<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'vv', '<C-v>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', 'vv', '<C-v>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'H', '0', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<A-n>', ':bnext<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<A-n>', '<ESC>:bnext<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('t', '<A-n>', '<C-\\><C-n>:bnext<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<A-p>', ':bprevious<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<A-p>', '<ESC>:bprevious<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('t', '<A-p>', '<C-\\><C-n>:bprevious<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>w', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<ESC><C-w>w', { noremap = false, silent = true })
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-n><C-w>w', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>W', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<ESC><C-w>W', { noremap = false, silent = true })
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-n><C-w>W', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<A-;>', ':', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<A-;>', '<ESC>:', { noremap = false, silent = true })
vim.api.nvim_set_keymap('t', '<A-;>', '<C-\\><C-n>:', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<A-/>', '/', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<A-/>', '<ESC>/', { noremap = false, silent = true })
vim.api.nvim_set_keymap('t', '<A-/>', '<C-\\><C-n>/', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>-', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<A-h>', '<ESC><C-w>-', { noremap = false, silent = true })
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-n><C-w>-', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>+', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<A-l>', '<ESC><C-w>+', { noremap = false, silent = true })
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n><C-w>+', { noremap = false, silent = true })

