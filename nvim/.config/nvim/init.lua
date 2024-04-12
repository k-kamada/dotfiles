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

-- file path separator
if vim.fn.has('win32') == 1 then
  -- Windows
  vim.opt.shellslash = false
else
  -- Linux/Mac
  vim.opt.shellslash = true
end

-- Set leader key to space
vim.g.mapleader = ' '

-- Line numbers
vim.opt.number = true

-- Highlight current line
vim.opt.cursorline = true

-- Move by visual line
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

-- Insert blank spaces by TabKey
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

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

require("lazy").setup({
})

