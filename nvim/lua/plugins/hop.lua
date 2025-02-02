vim.keymap.set("n", "<leader><leader>e", "<cmd>HopWord<CR>")
vim.keymap.set("n", "<leader><leader>c", "<cmd>HopChar1<CR>")
vim.keymap.set("n", "<leader><leader>v", "<cmd>HopVertical<CR>")

return {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup {
      keys = 'etovxqpdygfblzhckisuran',
    }
  end
}
