return {
    "rose-pine/neovim",
    lazy = false, -- 遅延ロードを無効化
    priority = 1000, -- 他のプラグインより先に読み込む
    config = function()
        vim.cmd("colorscheme rose-pine")
    end,
}
