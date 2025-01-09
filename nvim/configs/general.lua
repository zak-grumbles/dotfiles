--
--	General Configuration
--
vim.cmd('set nocompatible')
vim.opt.relativenumber = true
vim.opt.cursorline = true

	

-- Remaps
vu.nnoremap('j', 'gj')
vu.nnoremap('k', 'gk')

-- Buffer navigation and settings
vim.cmd('set splitbelow splitright')
vu.nnoremap('<C-L>', ':BufferNext<CR>')
vu.nnoremap('<C-H>', ':BufferPrevious<CR>')

require("flow").setup{
		dark_theme = true,
		high_constrast = true,
		transparent = true,
		fluo_color = "pink",
		aggressive_spell = false
}
vim.cmd('colo flow')

if vim.fn.has('win32') then
	vim.opt.shellcmdflag = '-c'
end

-- Filetype settings

-- C#
vim.api.nvim_create_autocmd('Filetype', {
	pattern = "cs",
	callback = function()
		vim.cmd('set tabstop=4 shiftwidth=4 expandtab')
	end
})

-- C++
vim.api.nvim_create_autocmd('Filetype', {
	pattern = "cpp",
	callback = function()
		vim.cmd('set tabstop=4 shiftwidth=4 expandtab')
	end
})

-- JSON
vim.api.nvim_create_autocmd('Filetype', {
	pattern = "json",
	callback = function()
		vim.cmd('set tabstop=4 shiftwidth=4 expandtab')
		vim.cmd('setlocal conceallevel=0')
	end
})
