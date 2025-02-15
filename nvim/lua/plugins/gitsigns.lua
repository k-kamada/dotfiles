return {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', '<C-g>h', gitsigns.preview_hunk)
          map('n', '<C-g>q', gitsigns.setqflist)

          map('n', '<C-g>b', gitsigns.toggle_current_line_blame)
          map('n', '<C-g>l', gitsigns.toggle_linehl)
          map('n', '<C-g>s', function()
            gitsigns.toggle_signs()
            gitsigns.toggle_numhl()
          end)
          map('n', '<C-g>w', gitsigns.toggle_word_diff)
        end,

        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      })
    end,
}
