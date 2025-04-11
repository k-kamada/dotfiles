return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    -- add any opts here
    provider = "gemini",
    auto_suggestions_provider = "gemini",
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "o1-mini",
      timeout = 30000,
      temperature = 0,
      max_tokens = 4096,
    },
    gemini = {
      endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
      model = "gemini-2.5-pro-exp-03-25",
      timeout = 30000,
      temperature = 0,
      max_tokens = 1000000,
    },
    deepseek = {
      endpoint = "https://api.deepseek.com",
      model = "o1-mini",
      timeout = 30000,
      temperature = 0,
      max_tokens = 4096,
    },
    vendors = {
      ---@type AvanteProvider
      ollama = {
        __inherited_from = "openai",
        api_key_name = "",
        endpoint = "http://localhost:11434/v1",
        model = "qwen2.5-coder:7b",
        max_tokens = 128000,
      },
    },
    -- 動作設定
    behaviour = {
      auto_suggestions = true,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true,
    },

    -- ウィンドウ設定
    windows = {
      position = "right",  -- サイドバーの位置
      wrap = true,        -- テキストの折り返し
      width = 30,         -- サイドバーの幅
      -- その他の詳細設定は省略
      ask = {
        floating = true,
        start_insert = true,
        border = "rounded",
      },
    }
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
