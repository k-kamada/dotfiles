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

  -- Breadcrumbs
  {import="plugins.dropbar"},
  -- Highlighting Symbol under cursor
  {import="plugins.illuminate"},

  -- NVim-Tree
  {import="plugins.nvim-tree"},
  -- Git Support
  {import="plugins.gitsigns"}, -- <C-g>l: Toggle linehl, <C-g>w: Toggle word_diff
  -- Find files in many contexts
  {import="plugins.telescope"}, -- l-ff:find files, l-fb: find buffers
  -- Show Outline Navigation
  {import="plugins.outline"}, -- <Leader>o : Toggle window

  -- Quickfix Window Preview
  {import="plugins.nvim-bqf"},
  -- Terminal management
  {import="plugins.toggleterm"},
  -- Show Zed like toolwindow
  {import="plugins.namu"}, -- <L>ss, <L>th
  -- Mark files
  {import="plugins.harpoon"}, -- <Leader>ha: Add file, <Leader>hp: Previous file, <Leader>hn: Next file

  -- Parenthesis Control
  {import="plugins.ultimate-autopair"},
  -- Tabout
  {import="plugins.tabout"}, -- <Tab> : Tabout, <S-Tab> : Backwards tabout
  -- Toggle Line Comment
  {import="plugins.comment"},
  -- Object Manipulation
  {import="plugins.treesj"}, -- <Leader>M : Toggle
  -- Code Jump
  {import="plugins.hop"},

  -- Quickrun
  {import="plugins.jaq-nvim"},

  -- LSP
  {import="plugins.lsp"},
  -- Completion
  {import="plugins.nvim-cmp"},
  -- Loading LSP Status
  {import="plugins.fidget"},
  -- Show lsp info
  {import="plugins.lsp_lines"}, -- <Leader>l : Toggle
  -- LLM Integration
  {import="plugins.copilot"},
  {import="plugins.copilot-status"},
})
