return {
  "github/copilot.vim",
  lazy=false,
  config = function()
    vim.g.copilot_no_tab_map = true,
    vim.keymap.set('i', '<C-C>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = "Accept copilot suggestion",
    })
    vim.keymap.set('i', '<C-E>', 'copilot#Dismiss()', {
      expr = true,
      replace_keycodes = false,
      desc = "Dismiss copilot suggestion",
    })
  end,
}
