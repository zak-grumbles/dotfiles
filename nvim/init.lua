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

Plug 'ibhagwan/fzf-lua'

-- Indent guides
Plug 'Yggdroot/indentline'

-- Tree
Plug 'nvim-tree/nvim-web-devicons'
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
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-pyclang'

-- Omnisharp
Plug 'OmniSharp/omnisharp-vim'

-- Bar
Plug 'lewis6991/gitsigns.nvim'
Plug 'romgrk/barbar.nvim'

-- Lualine
Plug 'nvim-lualine/lualine.nvim'

-- Auto pair
Plug 'jiangmiao/auto-pairs'

-- Floaterm
Plug 'voldikss/vim-floaterm'

-- Typst
Plug 'kaarmu/typst.vim'

-- Line wrapping for writing
Plug 'preservim/vim-pencil'

-- Distraction free mode
Plug 'junegunn/goyo.vim'

-- UI
Plug 'MunifTanjim/nui.nvim'

-- MSNVim
-- Plug 'D:\\Projects\\slnvim'

-- DAP 
Plug 'mfussenegger/nvim-dap'

-- Colorschemes
Plug 'tomasiser/vim-code-dark'
Plug 'slugbyte/lackluster.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'neanias/everforest-nvim'
Plug '0xstepit/flow.nvim'
Plug 'kvrohit/rasmus.nvim'
Plug 'aktersnurra/no-clown-fiesta.nvim'
Plug 'vague2k/vague.nvim'

vim.call('plug#end')

-- Utilities
require '.vim_utils'

require '.configs/general'
require '.configs/nvim_tree'
require '.configs/omnisharp'
require '.configs/lualine_conf'
require '.configs/ncm2_conf'
require '.configs/floaterm_conf'
require '.configs/pencil_conf'
require '.configs/dap'

vim.g.slnvim_auto_init = true
