return { {
  "nvimtools/none-ls.nvim",
  lazy = true,

  config = function()
    local null_ls = require('null_ls')
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.stylua,
      },
    })
  end,
}
}
