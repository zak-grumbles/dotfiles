--
-- Floaterm Settings
--

vim.g.floaterm_keymap_new = '<Leader>tn'
vim.g.floaterm_keymap_toggle = '<Leader>tt'

if vim.fn.has('win32') then
	vim.g.floaterm_shell = 'C:\\Program Files\\Git\\usr\\bin\\bash.exe'
end
