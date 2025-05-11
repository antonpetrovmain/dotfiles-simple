vim.api.nvim_set_keymap('n', '<esc>', ':nohlsearch<CR>', { desc = 'user: clear highlights when pressing escape', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ee', ':Lex 20 %:p:h <CR>', { desc = 'user: open browser on the left in the directory of the current file', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ef', ':let @/=expand("%:t") <Bar> execute "Lex" 20 expand("%:p:h") <Bar> normal n<CR>', { desc = 'user: open file explorer with current file path', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>id', ':lua vim.diagnostic.open_float()<CR>', { desc = 'user: show diagnostic message', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>if', ':lua vim.diagnostic.setqflist()<CR>', { desc = 'user: show all diagnostics in quick fix list', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ff', ':find<Space>', { desc = 'user: begin finding a file', noremap = true, silent = false })

vim.api.nvim_set_keymap('n', '<leader>ww', ':lua require("wilder").toggle()<CR>', { desc = 'user: toggle wilder', noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>a1', ':AvanteSwitchProvider qwen3-30b-a3b-dwq-05082025<CR>', { desc = 'user: avante switch to provider 1', noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>a2', ':AvanteSwitchProvider mlx-community/qwen3-32b<CR>', { desc = 'user: avante switch to provider 2', noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>a3', ':AvanteSwitchProvider deepseek-coder-v2-lite-instruct-mlx<CR>', { desc = 'user: avante switch to provider 3', noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>a4', ':AvanteSwitchProvider qwen3-32b<CR>', { desc = 'user: avante switch to provider 4', noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>aN', ':AvanteClear<CR>', { desc = 'user: avante clear', noremap = true, silent = true })
