pcall(require, "local")
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
  -- Syntax Highlighting
  {import="plugins.nvim-treesitter"},
  -- Chunk Highlighting
  {import="plugins.hlchunk"},
  -- Status line modifier
  { import="plugins.lualine" },
  -- Tab line modifier
  {import="plugins.barbar"},
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
  -- LSP
  {import="plugins.lsp"},
  -- Completion
  {import="plugins.nvim-cmp"},
  -- Object Manipulation
  {import="plugins.treesj"}, -- <Leader>M : Toggle
  -- Loading LSP Status
  {import="plugins.fidget"},
  -- Show Outline Navigation
  {import="plugins.outline"}, -- <Leader>o : Toggle window
  -- Formatter
  {import="plugins.conform"},
  -- LLM Integration
  {import="plugins.avante"},
  -- Code Jump
  {import="plugins.hop"},
  -- Quickrun
  {import="plugins.jaq-nvim"},
  -- Quickfix Window Preview
  {import="plugins.nvim-bqf"},
  -- Highlighting Symbol under cursor
  {import="plugins.illuminate"},
  -- Show lsp info
  {import="plugins.lsp_lines"}, -- <Leader>l : Toggle
  -- Show Zed like toolwindow
  {import="plugins.namu"},
})
