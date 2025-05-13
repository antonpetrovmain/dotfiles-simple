-- set colorscheme
vim.cmd.colorscheme('habamax')

-- set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'


-- show line numbers
vim.opt.number = true

-- configure path for the find command
vim.opt.path:append { "src/**", "lua/**", "ftplugin/**", "app/.", "app/src/**", "test/**", "templates/**", "config/**"}

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.colorcolumn = "80"
vim.cmd('highlight ColorColumn ctermbg=235 guibg=#262626')
		
