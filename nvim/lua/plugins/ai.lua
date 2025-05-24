return {
  {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = "lmstudio",
    vendors = {
      lmstudio = {
        __inherited_from = "openai",
        api_key_name = "LM_STUDIO_KEY",
        endpoint = "https://antonpetrov.dev/v1",
        model = os.getenv("MODEL_QWEN3"), -- your desired model (or use gpt-4o, etc.)
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
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
},
  {
    "milanglacier/minuet-ai.nvim",
    opts = {
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          -- accept whole completion
          accept = "<A-A>",
          -- accept one line
          accept_line = "<A-a>",
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          accept_n_lines = "<A-z>",
          -- Cycle to prev completion item, or manually invoke completion
          prev = "<A-[>",
          -- Cycle to next completion item, or manually invoke completion
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
      throttle = 1000, -- only send a request every 1000 ms
      debounce = 400,  -- wait 400 ms after last keystroke before sending
      request_timeout = 30,
      provider = "openai_fim_compatible",
      n_completions = 5, -- recommend for local model for resource saving
      -- I recommend beginning with a small context window size and incrementally
      -- expanding it, depending on your local computing power. A context window
      -- of 512, serves as an good starting point to estimate your computing
      -- power. Once you have a reliable estimate of your local computing power,
      -- you should adjust the context window to a larger value.
      context_window = 32000,
      provider_options = {
        openai_fim_compatible = {
          name = "LMStudio",
          end_point = "https://antonpetrov.dev/v1/completions",
          api_key = "LM_STUDIO_KEY",
          model = os.getenv('MODEL_QWEN3_MOE'),
          optional = {
            max_tokens = 128,
            top_p = 0.9,
            stop = { '\n\n' },
          },
        },
      },
    },
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    -- uncomment the following line to load hub lazily
    --cmd = "MCPHub",  -- lazy load
    -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
    -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
    opts = {
      extensions = {
        avante = {
          make_slash_commands = true,       -- make /slash commands from MCP server prompts
        },
        lualine = {},
      },
    }
  },
}
