require("options")
require("keymaps")

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin settings
require("lazy").setup({
  -- Colorscheme
  {import="plugins.colorscheme"},
  -- NVim-Tree
  {import="plugins.nvim-tree"},
  -- Git Support
  {import="plugins.gitsigns"},
  -- Parenthesis Control
  {import="plugins.autopairs"},
  -- Find files in many contexts
  {import="plugins.telescope"}, -- l-ff:find files, l-fb: find buffers
  -- Toggle Line Comment
  {import="plugins.comment"},
  -- Status line modifier
  {import="plugins.lualine"},
  -- Tab line modifier
  {import="plugins.barbar"},
  -- LSP
  {import="plugins.lsp"},
  -- Completion
  {import="plugins.nvim-cmp"},
  -- Syntax Highlighting
  {import="plugins.nvim-treesitter"},
  -- Chunk Highlighting
  {import="plugins.hlchunk"},
})
