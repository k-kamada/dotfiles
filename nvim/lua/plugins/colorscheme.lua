return {
    "cocopon/iceberg.vim",
    lazy = false, -- 遅延ロードを無効化
    priority = 1000, -- 他のプラグインより先に読み込む
    config = function()
        vim.cmd([[colorscheme iceberg]])
    end,
}
