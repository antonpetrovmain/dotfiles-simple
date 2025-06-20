return {
  { "mason-org/mason.nvim", cmd = "Mason", opts = {} },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- lsp
        "lua-language-server",
        "basedpyright",
        "jdtls",

        -- formatters
        "black",
        "stylua",

        -- linters
        "pylint",
        'flake8',
      },
    },
  },
}
