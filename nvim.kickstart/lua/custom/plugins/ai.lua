return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'LMStudio',
          variables = {
            ['buffer'] = {
              opts = {
                default_params = 'pin', -- or 'watch'
              },
            },
          },
        },
        cmd = {
          adapter = 'LMStudio',
        },
        inline = {
          adapter = {
            name = 'LMStudio',
            model = os.getenv 'MODEL_INLINE',
          },
        },
      },
      adapters = {
        LMStudio = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            env = {
              url = 'https://antonpetrov.dev',
              api_key = 'LM_STUDIO_KEY',
              chat_url = '/v1/chat/completions',
              models_endpoint = '/v1/models',
            },
            schema = {
              model = {
                default = os.getenv 'MODEL_CHAT', -- define llm model to be used
              },
            },
          })
        end,
      },
      opts = {
        -- Set debug logging
        log_level = 'DEBUG',
      },
      display = {
        chat = {
          window = {
            position = 'right',
          },
          auto_scroll = false,
        },
        inline = {
          layout = 'vertical', -- vertical|horizontal|buffer
        },
      },
    },
  },
  {
    'milanglacier/minuet-ai.nvim',
    opts = {
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          -- accept whole completion
          accept = '<A-A>',
          -- accept one line
          accept_line = '<A-a>',
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          accept_n_lines = '<A-z>',
          -- Cycle to prev completion item, or manually invoke completion
          prev = '<A-[>',
          -- Cycle to next completion item, or manually invoke completion
          next = '<A-]>',
          dismiss = '<A-e>',
        },
      },
      throttle = 50, -- only send a request every N ms
      debounce = 100, -- wait N ms after last keystroke before sending
      request_timeout = 60,
      provider = 'openai_fim_compatible',
      n_completions = 5, -- recommend for local model for resource saving
      -- I recommend beginning with a small context window size and incrementally
      -- expanding it, depending on your local computing power. A context window
      -- of 512, serves as an good starting point to estimate your computing
      -- power. Once you have a reliable estimate of your local computing power,
      -- you should adjust the context window to a larger value.
      context_window = 32768,
      provider_options = {
        openai_fim_compatible = {
          name = 'LMStudio',
          end_point = 'https://antonpetrov.dev/v1/completions',
          api_key = 'LM_STUDIO_KEY',
          model = os.getenv 'MODEL_AUTOCOMPLETE',
          optional = {
            max_tokens = 512,
            temperature = 0.1,
            top_p = 0.95,
            stop = { '\n\n' },
          },
        },
      },
    },
  },
}
