vim.api.nvim_set_keymap('n', '<LEADER>tb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>tf', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>tg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>tl', ':Telescope lsp_references<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>tt', ':Telescope treesitter<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<LEADER>fe', ':e .<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LEADER>fp', ':Telescope projects<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<LEADER>ea', '<Plug>(EasyAlign)', { noremap = true, silent = true})

