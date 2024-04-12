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

-- File
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.helplang = "ja"
vim.opt.hidden = true

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

-- プラグインの設定
require("lazy").setup({
  -- Sidebar Tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        -- ここにnvim-tree.luaの設定を記述
      view = {
        width = 30,
        side = left,
      },
      })
      vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },

  -- Git Support
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end,
  },

  -- Parenthesis Control
  {
    'windwp/nvim-autopairs',
     event = "InsertEnter",
     config = true
     -- use opts = {} for passing setup options
     -- this is equalent to setup({}) function
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "❯ ",
          selection_caret = "❯ ",
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })

      -- キーマッピングの設定
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },

  {
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
      vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", { noremap = true, silent = true })
    end,
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Tab line
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  -- LSP関連のプラグイン
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({})
        end,
      })
    end,
  },

  -- 補完関連のプラグイン
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
  },
})

-- LSPの設定
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- LSPサーバーを登録する
local lsp_flags = {
  debounce_text_changes = 150,
}
require("lspconfig")["pyright"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
})
require("lspconfig")["tsserver"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
})
require("lspconfig")["clangd"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },
})
require("lspconfig")["rust_analyzer"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
