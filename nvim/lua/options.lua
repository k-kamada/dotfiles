-- Use system clipboard
if vim.fn.has('wsl') == 1 then
  -- WSL (Windows Subsystem for Linux)
  vim.opt.clipboard = 'unnamedplus'
elseif vim.fn.has('win32') == 1 then
  -- Windows
  vim.opt.clipboard = 'unnamed'
else
  -- Linux/Mac
  vim.opt.clipboard = 'unnamedplus'
end

-- use xclip
vim.g.clipboard = {
  name = 'xclip',
  copy = {
    ['+'] = 'xclip -selection clipboard -i',
    ['*'] = 'xclip -selection primary -i',
  },
  paste = {
    ['+'] = 'xclip -selection clipboard -o',
    ['*'] = 'xclip -selection primary -o',
  },
}

-- File
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.helplang = "ja"
vim.opt.hidden = true

-- Enable mouse Control
vim.opt.mouse = "a"

-- Line numbers
vim.opt.number = true
vim.opt.ruler = true

-- Highlight current line
vim.opt.cursorline = true

-- Show invisible characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
  nbsp = "␣",
  extends = "❯",
  precedes = "❮",
}

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Auto detect filetypes
vim.cmd([[
  filetype plugin indent on
  syntax enable
  autocmd FileType * set formatoptions-=ro
]])
