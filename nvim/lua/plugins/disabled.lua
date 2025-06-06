return {
  {
  "antonpetrovmain/avante.nvim",
  enabled = false,
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "lmstudio_qwen3moe",
    vendors = {
      lmstudio_qwen3moe = {
        __inherited_from = "openai",
        api_key_name = "LM_STUDIO_KEY",
        endpoint = "https://antonpetrov.dev/v1",
        model = "qwen3-30b-a3b@8bit",
      },
      lmstudio_qwen3 = {
        __inherited_from = "openai",
        api_key_name = "LM_STUDIO_KEY",
        endpoint = "https://antonpetrov.dev/v1",
        model = "qwen3-32b-mlx@4bit",
      },
      lmstudio_qwen25 = {
        __inherited_from = "openai",
        api_key_name = "LM_STUDIO_KEY",
        endpoint = "https://antonpetrov.dev/v1",
        model = "qwen2.5-coder-32b-instruct@4bit",
      },
      lmstudio_deepseek = {
        __inherited_from = "openai",
        api_key_name = "LM_STUDIO_KEY",
        endpoint = "https://antonpetrov.dev/v1",
        model = "deepseek-coder-v2-lite-instruct@4bit",
      },
      lmstudio_devstral = {
        __inherited_from = "openai",
        api_key_name = "LM_STUDIO_KEY",
        endpoint = "https://antonpetrov.dev/v1",
        model = "devstral-small-2505@8bit",
      },
      lmstudio_glm = {
        __inherited_from = "openai",
        api_key_name = "LM_STUDIO_KEY",
        endpoint = "https://antonpetrov.dev/v1",
        model = "glm-4-32b@8bit",
      },
    },
    web_search_engine = {
      provider = "google", -- tavily, serpapi, searchapi, google, kagi, brave, or searxng
      proxy = nil,   -- proxy support, e.g., http://127.0.0.1:7890
    },
        -- system_prompt as function ensures LLM always has latest MCP server state
    -- This is evaluated for every message, even in existing chats
    system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
    end,
    -- Using function prevents requiring mcphub before it's loaded
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
    "ravitemer/mcphub.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup()
    end
  },

}
