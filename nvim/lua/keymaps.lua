-- Set leader key to space
vim.g.mapleader = ' '

-- Move by visual line
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- Back from terminal
vim.api.nvim_set_keymap('n', '<leader>t', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>t', '<C-\\><C-n>:bn<CR>', { noremap = true, silent = true })
