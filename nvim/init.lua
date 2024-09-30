-- Configure require path
local pkg_path = vim.fn.stdpath("config") .. '/?.lua;'
pkg_path = pkg_path .. vim.fn.stdpath("config") .. 'configs/?.lua;'
pkg_path = pkg_path .. package.path
package.path = pkg_path

-- Lua wrapper
local Plug = vim.fn['plug#']

--
-- Plugins
-- 
vim.call('plug#begin')

-- Syntax
Plug 'vim-syntastic/syntastic'

-- Indent guides
Plug 'Yggdroot/indentline'

-- Icons
Plug 'nvim-tree/nvim-web-devicons'

-- Tree
Plug 'nvim-tree/nvim-tree.lua'

-- Syntax checking
Plug 'dense-analysis/ale'

-- Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

-- Completion sources
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-vim'

-- Omnisharp
Plug 'OmniSharp/omnisharp-vim'

-- Fzf
Plug('junegunn/fzf', { ['do'] = './install --bin' })
Plug 'junegunn/fzf.vim'

-- Colorschemes
Plug 'tomasiser/vim-code-dark'

vim.call('plug#end')

-- Utilities
require '.vim_utils'

require '.configs/general'
require '.configs/nvim_tree'
require '.configs/omnisharp'
