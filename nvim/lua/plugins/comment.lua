return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
        padding = true, --spaces before and after comment
        sticky = true, --whether keep comment position or not
        ignore = nil, --filetypes to ignore
        mappings = {
            basic = true,
            extra = true,
            extended = false,
        },
        pre_hook = nil,
        post_hook = nil,
        })
        -- 'C-_' means 'Control + Slash'
        vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", { noremap = true, silent = true })
    end,
}
