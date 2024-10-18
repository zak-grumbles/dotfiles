
local pencil_group = vu.augroup('pencil', true)

vim.api.nvim_create_autocmd('FileType', {
	pattern = "typst",
	callback = function()
		vim.cmd('Pencil')
	end,
	group = pencil_group
})
