return {
  "github/copilot.vim",
  lazy=false,
  config = function()
    -- Don't use tab for completion
    vim.g.copilot_no_tab_map = true
    -- Accept
    vim.keymap.set('i', '<C-A>', 'copilot#Accept("\\<CR>")', {
     expr = true,
     replace_keycodes = false,
     desc = "Accept copilot suggestion",
    })
    -- Deny
    vim.keymap.set('i', '<C-E>', 'copilot#Dismiss()', {
     expr = true,
     replace_keycodes = false,
     desc = "Dismiss copilot suggestion",
    })
    -- Toggle copilot
    vim.keymap.set('n', '<C-C>', function()
      if vim.g.copilot_enabled then
        vim.g.copilot_enabled = false
        print("Copilot disabled")
      else
        vim.g.copilot_enabled = true
        print("Copilot enabled")
      end
    end, { desc = "Toggle Copilot" })
  end
}
