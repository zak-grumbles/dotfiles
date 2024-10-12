--
-- Neovim Completion Manager 2 Options
--

vim.api.nvim_create_autocmd('BufEnter', {
	pattern = '*',
	callback = function() vim.fn['ncm2#enable_for_buffer']() end
})

vim.cmd('set completeopt=noinsert,menuone,noselect')

vim.keymap.set('i', '<Tab>', function()
	if vim.fn.pumvisible() == 1 then return '\\<C-n>' end
	return '\\<Tab>'
end, { expr = true })
vim.keymap.set('i', '<S-Tab>', function()
	if vim.fn.pumvisible() == 1 then return '\\<C-p>' end
	return '\\<S-Tab>'
end, { expr = true })
