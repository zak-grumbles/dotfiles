local dap = require('dap')

dap.adapters.coreclr = {
	type = 'executable',
	command = 'C:\\Users\\zakgr\\scoop\\shims\\netcoredbg.exe',
	args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
		end
	}
}

