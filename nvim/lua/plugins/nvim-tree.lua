return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        -- ここにnvim-tree.luaの設定を記述
        view = {
          adaptive_size = true,
          side = left,
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
      })
      vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
}
