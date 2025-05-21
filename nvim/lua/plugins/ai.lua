return {
   {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", opts = {
     highlight = { enable = true }, indent = { enable = true },  }, },
   {
    "antonpetrovmain/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        display = {
          chat = {
            window = {
              position = "right",
              width = 0.4,
            },
          },
        },
        strategies = {
          chat = { adapter = "lmstudio" },
          window_position = "right",
          cmd = { adapter = "lmstudio" },  -- you can call it whatever you like
          inline = { adapter = "lmstudio" },  -- you can call it whatever you like
        },
        adapters = {
          lmstudio = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url       = "https://antonpetrov.dev",
                chat_url  = "/v1/chat/completions",
                api_key   = vim.env.LM_STUDIO_KEY or "",
              },
              schema = {
                model = {
                  default  = os.getenv('MODEL_QWEN3_MOE'),
                  choices  = { os.getenv('MODEL_QWEN3_MOE'), os.getenv('MODEL_QWEN3') },
                },
              },
            })
          end,
        },
        extensions = {
        mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
                show_result_in_chat = true, -- Show the mcp tool result in the chat buffer
                make_vars = true, -- make chat #variables from MCP server resources
                make_slash_commands = true, -- make /slash_commands from MCP server prompts
            },
        }
    },
      })
    end,
  },
  {
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
            },
            lualine = {},
        },
    }
  },
}
