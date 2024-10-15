--
--	General Configuration
--
vim.cmd('set nocompatible')
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.api.nvim_create_autocmd('Filetype', {
	pattern = "cs",
	callback = function()
		vim.cmd('set tabstop=4 shiftwidth=4 expandtab')
	end
})
	

-- Remaps
vu.nnoremap('j', 'gj')
vu.nnoremap('k', 'gk')

-- Buffer navigation and settings
vim.cmd('set splitbelow splitright')
vu.nnoremap('<C-L>', ':bn<CR>')
vu.nnoremap('<C-H>', ':bp<CR>')

-- require("flow").setup{
-- 		dark_theme = true,
-- 		high_constrast = true,
-- 		transparent = true,
-- 		fluo_color = "pink",
-- 		aggressive_spell = false
-- }
vim.cmd('colo everforest')

if vim.fn.has('win32') then
	vim.opt.shellcmdflag = '-c'
end
