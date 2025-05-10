return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    keys = {
      {
        ']h',
        ':Gitsigns next_hunk<CR>',
        desc = 'Go to next git change',
      },
      {
        '[h',
        ':Gitsigns prev_hunk<CR>',
        desc = 'Go to previous git change',
      },
    },
  },
}
