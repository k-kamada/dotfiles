return {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    init = function() vim.g.barbar_auto_setup = false end,
    config = function()
      require('barbar').setup {
      }
      local map = vim.api.nvim_set_keymap
      local opts = {
        noremap = true,
        silent = true,
      }
      map('n', '<C-k>', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<C-j>', '<Cmd>BufferNext<CR>', opts)
      map('n', '<Leader>c', '<Cmd>BufferClose<CR>', opts)
    end,
}
