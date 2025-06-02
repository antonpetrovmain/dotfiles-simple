vim.api.nvim_set_keymap('n', '<esc>', ':nohlsearch<CR>', { desc = 'user: clear highlights when pressing escape', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ee', ':Lex 20 %:p:h <CR>', { desc = 'user: open browser on the left in the directory of the current file', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ef', ':let @/=expand("%:t") <Bar> execute "Lex" 20 expand("%:p:h") <Bar> normal n<CR>', { desc = 'user: open file explorer with current file path', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>id', ':lua vim.diagnostic.open_float()<CR>', { desc = 'user: show diagnostic message', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>if', ':lua vim.diagnostic.setqflist()<CR>', { desc = 'user: show all diagnostics in quick fix list', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ff', ':find<Space>', { desc = 'user: begin finding a file', noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>fg', ':vimgrep<Space>', { desc = 'user: grep a string in files', noremap = true, silent = false })

vim.api.nvim_set_keymap('n', '<leader>ww', ':lua require("wilder").toggle()<CR>', { desc = 'user: toggle wilder', noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
