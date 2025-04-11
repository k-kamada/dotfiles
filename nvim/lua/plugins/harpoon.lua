return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        save_on_ui_close = true,
      }
    })

    local harpoon_extensions = require("harpoon.extensions")
    harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
    harpoon:extend(harpoon_extensions.builtins.navigate_with_number())

    vim.keymap.set("n", "'", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev({ui_nav_wrap = true}) end)
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next({ui_nav_wrap = true}) end)
  end
}
