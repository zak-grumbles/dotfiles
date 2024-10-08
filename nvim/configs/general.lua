--
--	General Configuration
--
vim.cmd('set nocompatible')
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.shiftwidth = 4

-- Remaps
vu.nnoremap('j', 'gj')
vu.nnoremap('k', 'gk')

-- Buffer navigation and settings
vim.cmd('set splitbelow splitright')
vu.nnoremap('<C-L>', ':bn<CR>')
vu.nnoremap('<C-H>', ':bp<CR>')

vim.cmd('colo codedark')
