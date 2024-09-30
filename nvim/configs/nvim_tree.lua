--
--	Tree
--
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vu.nnoremap('<Leader>f', ':NvimTreeToggle<CR>')
