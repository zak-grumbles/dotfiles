--
--	Omnisharp Settings
--
vim.g.OmniSharp_selector_ui = 'fzf'
vim.g.OmniSharp_server_stdio = 0

vim.cmd('set previewheight=5')

local os_group = vu.augroup('omnisharp_commands', true)

local function add_os_autocmd(k, v)
		vim.api.nvim_create_autocmd('FileType', {
				pattern = "cs",
				callback = function()
						vu.nnoremap(k, v, { buffer = true })
				end,
				group = os_group
		})
end

vim.api.nvim_create_autocmd('CursorHold', {
		pattern = "cs",
		callback = function() vim.cmd(':OmniSharpTypeLookup') end,
		group = os_group
})
				


local autocmd_map = {
		['gd'] = ':OmniSharpGotoDefinition<CR>',
		['<Leader>fi'] = ':OmniSharpFindImplementation<CR>',
		['<Leader>fs'] = ':OmniSharpFindSymbol<CR>',
		['<Leader>fu'] = ':OmniSharpFindUsages<CR>',
		['<Leader>fm'] = ':OmniSharpFindMembers<CR>',
		['<Leader>fx'] = ':OmniSharpFixUsings<CR>',
		['<Leader>tt'] = ':OmniSharpTypeLookup<CR>',
		['<Leader>dc'] = ':OmniSharpDocumentation<CR>',

		['<C-\\>'] = ':OmniSharpSignatureHelp<CR>',
		['<C-k>'] = ':OmniSharpNavigateUp<CR>',
		['<C-j>'] = ':OmniSharpNavigateDown<CR>',
		['<Leader>cc'] = ':OmniSharpGlobalCodeCheck<CR>'
}

for k, v in pairs(autocmd_map) do
		add_os_autocmd(k, v)
end

vu.nnoremap('<Leader><Space>', ':OmniSharpGetCodeActions<CR>')
vu.nnoremap('<Leader><Space>', ':call OmniSharp#actions#codeaction#Get(\'visual\')<CR>')

vu.nnoremap('<Leader>nm', ':OmniSharpRename<CR>')
vu.nnoremap('<F2>', ':OmniSharpRename<CR>')

vu.command('Rename', function(opts)
		vim.fn['OmniSharp#RenameTo'](opts.fargs[1])
end)

vim.g.syntastic_cs_checkers = { 'code_checker' }
