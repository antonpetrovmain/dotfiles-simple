vim.api.nvim_set_keymap('n', '<esc>', ':nohlsearch<CR>', { desc = 'user: clear highlights when pressing escape', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ee', ':Lex 15 %:p:h <CR>', { desc = 'user: open browser on the left in the directory of the current file', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ef', ':let @/=expand("%:t") <Bar> execute "Lex" 15 expand("%:p:h") <Bar> normal n<CR>', { desc = 'user: open file explorer with current file path', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>id', ':lua vim.diagnostic.open_float()<CR>', { desc = 'user: show diagnostic message', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>if', ':lua vim.diagnostic.setqflist()<CR>', { desc = 'user: show all diagnostics in quick fix list', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>is', ':lua vim.diagnostic.show()<CR>', { desc = 'user: show diagnostic message', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ih', ':lua vim.diagnostic.hide()<CR>', { desc = 'user: show diagnostic message', noremap = true, silent = true })

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
