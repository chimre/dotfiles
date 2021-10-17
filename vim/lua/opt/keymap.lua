-- edit
vim.api.nvim_set_keymap('v', '<LEADER>ea', '<Plug>(EasyAlign)', { noremap = false, silent = true})

-- find
vim.api.nvim_set_keymap('n', '<LEADER>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>fp', ':Telescope projects<CR>', { noremap = true, silent = true })

-- reference
vim.api.nvim_set_keymap('n', '<LEADER>rf', ':Telescope file_browser<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LEADER>rl', ':Telescope lsp_references<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>rp', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>rt', ':Telescope treesitter<CR>', { noremap = true, silent = true })

