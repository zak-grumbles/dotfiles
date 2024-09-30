--
--	Vim API Utility methods
--

vu = {}

function vu.nnoremap(keys, mapped)
        vim.keymap.set('n', keys, mapped)
end

function vu.augroup(name, shouldClear)
        return vim.api.nvim_create_augroup(
                name, { clear = shouldClear }
        )
end

function vu.autocmd(events, pattern, cmd, group)
        local opts = {
                pattern = pattern,
                command = cmd
        }
        if group ~= nil then
                opts['group'] = group
        end
        vim.api.nvim_create_autocmd(events, opts)
end

function vu.command(name, func, argc)
		vim.api.nvim_create_user_command( name, func, 
				{ nargs = argc })
end
