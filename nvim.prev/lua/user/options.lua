-- set colorscheme
vim.cmd.colorscheme("habamax")
vim.o.termguicolors = true

-- set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- show line numbers
vim.opt.number = true

-- configure path for the find command
vim.opt.path:append({ "src/**", "lua/**", "ftplugin/**", "app/.", "app/src/**", "test/**", "templates/**", "config/**" })

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.colorcolumn = "80"
vim.cmd("highlight ColorColumn ctermbg=235 guibg=#262626")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
