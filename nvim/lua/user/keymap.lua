vim.api.nvim_set_keymap('n', '<esc>', ':nohlsearch<CR>', { desc = 'user: clear highlights when pressing escape', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ee', ':Lex 15 %:p:h <CR>', { desc = 'user: open browser on the left in the directory of the current file', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ef', ':let @/=expand("%:t") <Bar> execute "Lex" 15 expand("%:p:h") <Bar> normal n<CR>', { desc = 'user: open file explorer with current file path', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ff', ':find<Space>*', { desc = 'user: begin finding a file', noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>fg', ':vimgrep<Space>', { desc = 'user: grep a string in files', noremap = true, silent = false })

vim.api.nvim_set_keymap('n', '<leader>ww', ':lua require("wilder").toggle()<CR>', { desc = 'user: toggle wilder', noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>aA", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>ab", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>hd', ':Gitsigns diffthis<CR>', { desc = 'user: show the current hunk in a diff', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'user: reset the current hunk', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hp', ':Gitsigns preview_hunk_inline<CR>', { desc = 'user: show the current hunk in a diff', noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

-- =============================================================================
-- -- Diagnostic Keymap Functions
-- =============================================================================

-- A helper function to make diagnostic configuration more concise.
-- It applies the same severity filter to virtual_text, signs, and underlining.
local function set_diagnostic_severity(min_severity)
  vim.diagnostic.config({
    virtual_text = { severity = { min = min_severity } },
    signs = { severity = { min = min_severity } },
    underline = { severity = { min = min_severity } },
  })
  -- Refresh diagnostics to apply the new configuration immediately
  vim.diagnostic.show()
end

-- =============================================================================
-- Basic Diagnostic Mappings
-- =============================================================================

-- Show diagnostic message under the cursor in a floating window
vim.api.nvim_set_keymap('n', '<leader>id', '<cmd>lua vim.diagnostic.open_float()<CR>',
  { desc = 'Show diagnostic message', noremap = true, silent = true })

-- Add all diagnostics for the current buffer to the quickfix list
vim.api.nvim_set_keymap('n', '<leader>if', '<cmd>lua vim.diagnostic.setqflist()<CR>',
  { desc = 'Show all diagnostics in quickfix', noremap = true, silent = true })

-- Go to the previous diagnostic
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
  { desc = 'Go to previous diagnostic', noremap = true, silent = true })

-- Go to the next diagnostic
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>',
  { desc = 'Go to next diagnostic', noremap = true, silent = true })


-- =============================================================================
-- Diagnostic Visibility Mappings
-- =============================================================================

-- Show all diagnostics (Errors, Warnings, Info, Hints)
vim.api.nvim_set_keymap('n', '<leader>ia', '', {
  callback = function()
    -- Using vim.diagnostic.severity.HINT ensures all levels are visible.
    set_diagnostic_severity(vim.diagnostic.severity.HINT)
  end,
  desc = 'Show all diagnostics',
  noremap = true,
  silent = true
})

-- Show only Errors
-- This is the keymap that addresses your primary request.
vim.api.nvim_set_keymap('n', '<leader>ie', '', {
  callback = function()
    set_diagnostic_severity(vim.diagnostic.severity.ERROR)
  end,
  desc = 'Show Errors only',
  noremap = true,
  silent = true
})

-- Show Warnings and Errors
vim.api.nvim_set_keymap('n', '<leader>iw', '', {
  callback = function()
    set_diagnostic_severity(vim.diagnostic.severity.WARN)
  end,
  desc = 'Show Warnings and Errors',
  noremap = true,
  silent = true
})

-- Show Info, Warnings, and Errors
vim.api.nvim_set_keymap('n', '<leader>ii', '', {
  callback = function()
    set_diagnostic_severity(vim.diagnostic.severity.INFO)
  end,
  desc = 'Show Info, Warnings, and Errors',
  noremap = true,
  silent = true
})

-- Toggle all diagnostics on/off without changing the severity filter
vim.api.nvim_set_keymap('n', '<leader>ih', '', {
  callback = function()
    local config = vim.diagnostic.config()
    -- Check a field that is a table to see if diagnostics are configured to be shown
    if config ~= nil and config.virtual_text and type(config.virtual_text) == "table" then
      vim.diagnostic.hide()
    else
      vim.diagnostic.show()
    end
  end,
  desc = 'Toggle all diagnostics',
  noremap = true,
  silent = true
})
