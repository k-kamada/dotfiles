return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
        -- ここにnvim-tree.luaの設定を記述
        view = {
        --width = 30,
        adaptive_size = true,
        side = left,
        },
        })
        vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
}
