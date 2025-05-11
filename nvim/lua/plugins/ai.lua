-- Neovim AI Configuration: Code completion/chat plugins (LM Studio, OpenAI FIM, Qwen, DeepSeek)
-- Includes model settings, keybindings, and AI assistant integrations

return {
   {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = { adapter = "lmstudio" },  -- you can call it whatever you like
        },
        adapters = {
          lmstudio = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                -- 1️⃣  Base URL (NO trailing slash)
                url       = "https://antonpetrov.dev",
                -- 2️⃣  Endpoint for chat completions (defaults to /v1/chat/completions,
                --     but it’s clearer to pin it explicitly)
                chat_url  = "/v1/chat/completions",
                -- 3️⃣  Bearer token – pulled straight from your shell env
                api_key   = vim.env.LM_STUDIO_KEY or "",
              },

              -- 4️⃣  Tiny schema so CodeCompanion doesn’t call /v1/models
              schema = {
                model = {
                  default  = "qwen3-30b-a3b-mlx",
                  choices  = { "qwen3-30b-a3b-mlx" },
                },
              },
            })
          end,
        },
      })
    end,
  },
  {
     enabled = false,
    "milanglacier/minuet-ai.nvim",
    opts = {
      virtualtext = {
        auto_trigger_ft = { },
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
      throttle = 1000,   -- only send a request every 1000 ms  
      debounce = 400,    -- wait 400 ms after last keystroke before sending
      request_timeout = 30,
      provider = "openai_fim_compatible",
      n_completions = 5, -- recommend for local model for resource saving
      -- I recommend beginning with a small context window size and incrementally
      -- expanding it, depending on your local computing power. A context window
      -- of 512, serves as an good starting point to estimate your computing
      -- power. Once you have a reliable estimate of your local computing power,
      -- you should adjust the context window to a larger value.
      context_window = 160000,
      provider_options = {
        openai_fim_compatible = {
          name = "LMStudio",
          end_point = "https://antonpetrov.dev/v1/completions",
          api_key = "LM_STUDIO_KEY",
          model = "deepseek-coder-v2-lite-instruct-mlx",
          optional = {
                max_tokens = 56,
                top_p = 0.9,
            },
          },
       },
    },
  },
  {
     enabled = false,
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "qwen3-30b-a3b-dwq-05082025", -- You can then change this provider here
      vendors = {
        ["qwen3-30b-a3b-dwq-05082025"] = {
          __inherited_from = "openai",
          endpoint = "https://antonpetrov.dev/v1", -- The full endpoint of the provider
          model = "qwen3-30b-a3b-dwq-05082025", -- The model name to use with this provider
          api_key_name = "LM_STUDIO_KEY", -- The name of the environment variable that contains the API key
          max_tokens = 40000,
        },
        ["mlx-community/qwen3-32b"] = {
          __inherited_from = "openai",
          endpoint = "https://antonpetrov.dev/v1", -- The full endpoint of the provider
          model = "mlx-community/qwen3-32b", -- The model name to use with this provider
          api_key_name = "LM_STUDIO_KEY", -- The name of the environment variable that contains the API key
          max_tokens = 40000,
        },
        ["qwen3-32b"] = {
          __inherited_from = "openai",
          endpoint = "https://antonpetrov.dev/v1", -- The full endpoint of the provider
          model = "qwen3-32b", -- The model name to use with this provider
          api_key_name = "LM_STUDIO_KEY", -- The name of the environment variable that contains the API key
          max_tokens = 40000,
        },
        ["deepseek-coder-v2-lite-instruct-mlx"] = {
          __inherited_from = "openai",
          endpoint = "https://antonpetrov.dev/v1", -- The full endpoint of the provider
          model = "deepseek-coder-v2-lite-instruct-mlx", -- The model name to use with this provider
          api_key_name = "LM_STUDIO_KEY", -- The name of the environment variable that contains the API key
          max_tokens = 160000,
        },
      },
      windows = {
        width = 40,
      },
      disabled_tools = {
          "list_files",
          "search_files",
          "read_file",
          "create_file",
          "rename_file",
          "delete_file",
          "create_dir",
          "rename_dir",
          "delete_dir",
          "bash",
      },
      -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
      system_prompt = function()
          local hub = require("mcphub").get_hub_instance()
          return hub:get_active_servers_prompt()
      end,
      -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
      custom_tools = function()
          return {
              require("mcphub.extensions.avante").mcp_tool(),
          }
      end,
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      { "nvim-lua/plenary.nvim", version = false },
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
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
    },
  },
  {
     enabled = false,
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- Required for Job and HTTP requests
    },
    -- uncomment the following line to load hub lazily
    --cmd = "MCPHub",  -- lazy load 
    build = "npm install -g mcp-hub@latest",  -- Installs required mcp-hub npm module
    -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
    -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
    opts = {
        extensions = {
            avante = {
                make_slash_commands = true, -- make /slash commands from MCP server prompts
            }
        }
    }
  }
}
