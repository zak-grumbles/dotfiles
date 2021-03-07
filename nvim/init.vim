""""""""""""""""""""""""""""""
"   Vim-Plug Settings
""""""""""""""""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')

" NerdTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Syntastic
Plug 'vim-syntastic/syntastic'

" Better visual guides
Plug 'Yggdroot/indentLine'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax checking
Plug 'dense-analysis/ale'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Completion sources
Plug 'ncm2/ncm2-bufword'            " current buffer
Plug 'ncm2/ncm2-path'               " path
Plug 'ncm2/ncm2-tern'               
Plug 'ncm2/ncm2-jedi'               " python
Plug 'ncm2/ncm2-github'             " repo completion
Plug 'ncm2/ncm2-vim'                " vimscript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'for': 'typescript', 'do': './install.sh'}
Plug 'jiangmiao/auto-pairs'

" Omnisharp
Plug 'OmniSharp/omnisharp-vim'

" Color schemes
Plug 'tomasiser/vim-code-dark'

" NPM
Plug '~/projects/npvim'

" Git
Plug 'tpope/vim-fugitive'

" CSS color preview
Plug 'ap/vim-css-color'

" FZF
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

call plug#end()

""""""""""""""""""""""""""""""
"   General Settings
""""""""""""""""""""""""""""""
set nocompatible

" tabs
set ts=4 sw=4 expandtab
set smarttab autoindent smartindent

" Line numbers
set nu relativenumber
set cursorline

" Wrapped line navigation
nnoremap j gj
nnoremap k gk

" Search
set hlsearch incsearch showmatch

" Command settings
set showcmd
set wildmenu
set lazyredraw

" Filetype recognition
filetype plugin indent on

" Syntax highlighting
syntax on

" Buffer nav & settings
set splitbelow splitright
map <C-L> :bn<CR>
map <C-H> :bp<CR>

" Colorscheme
colo codedark

set termguicolors

""""""""""""""""""""""""""""""
"   NERDTree Settings
""""""""""""""""""""""""""""""

" Auto start if opening directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quitting work as expected if only window open is tree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Remap toggle
nnoremap <Leader>f :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
"   Airline Settings
"""""""""""""""""""""""""""""""
let g:airline#estensions#tabline#enabled = 1
let g:airline#tabline#left_sep = ' '
let g:airline#tabline#left_alt_sep = '|'
let g:airline_theme = 'qwq'

set noshowmode

set showtabline=2
set laststatus=2


""""""""""""""""""""""""""""""
"   NCM2 (Autocomplete) Settings
""""""""""""""""""""""""""""""
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" <Enter> when popup is open now closes menu and starts new line
" rather than just closing menu
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" <TAB> selects popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""""""""""""""""""""""""""""""
"   Syntastic Settings
""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""""""""""""""""""""""""""""""
"   OmniSharp Settings
""""""""""""""""""""""""""""""
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_server_stdio = 0

set previewheight=5

augroup omnisharp_commands
    autocmd!

    autocmd CursorHold *.cs OmniSharpTypeLookup

    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmnisharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> <C-o> :OmniSharpSignatureHelp<CR>

    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>

nnoremap <Leader><Space> :call OmniSharp#actions#codeaction#Get('visual')<CR>

nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>

command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

let g:syntastic_cs_checkers = ['code_checker']
