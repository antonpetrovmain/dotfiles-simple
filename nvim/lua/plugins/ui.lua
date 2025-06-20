return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight        = { enable = true },
        indent           = { enable = true },
        fold             = { enable = true, disable = {} },
        ensure_installed = { "markdown", "markdown_inline", "lua", "python", "java", "json", "yaml", },
        auto_install     = true, }
    end

  },
}
