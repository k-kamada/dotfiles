return {
    "rebelot/kanagawa.nvim",
    lazy = false, -- 遅延ロードを無効化
    priority = 1000, -- 他のプラグインより先に読み込む
    config = function()
        require('kanagawa').setup({
          commentStyle = { italic = false },
          keywordStyle = { italic = false },
        })
        vim.cmd("colorscheme kanagawa-dragon")
    end,
}
