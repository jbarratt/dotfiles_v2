call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-vinegar'
Plug 'fatih/vim-go'
Plug 'klen/python-mode'
Plug 'davidoc/taskpaper.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'djoshea/vim-autoread'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'ekalinin/Dockerfile.vim'
Plug 'pearofducks/ansible-vim'
Plug 'cespare/vim-toml'
Plug 'muziqiushan/bufonly'
call plug#end()

set bg=dark
colorscheme Tomorrow-Night

set nocp
set ai to shell=/bin/bash terse nowarn sm ruler sw=4 ts=4
set smartcase

nnoremap j gj
nnoremap k gk

set relativenumber
set cursorline

autocmd filetype taskpaper let g:auto_save = 1
autocmd filetype taskpaper :WatchForChanges!

let mapleader = ','
let maplocalleader = ","

" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_tomorrow'

"""
""" Visually indicate long columns
""" Taken from https://www.youtube.com/watch?v=aHm36-na4-4
"""
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Better autocompletion for filenames, buffers, colors, etc.
set wildmenu
set wildmode=longest:full,full

if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif


" for editing files next to the open one
" http://vimcasts.org/episodes/the-edit-command/
noremap <leader>ew :e <C-R>=expand("%:.:h") . "/" <CR>
noremap <leader>es :sp <C-R>=expand("%:.:h") . "/" <CR>
noremap <leader>ev :vsp <C-R>=expand("%:.:h") . "/" <CR>
noremap <leader>et :tabe <C-R>=expand("%:.:h") . "/" <CR>

let g:pymode_options = 0
let g:pymode_run = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pylint']
let g:pymode_rope_complete_on_dot = 0

" settings for go
" fold go files with syntax
au FileType go setlocal foldmethod=syntax
" use goimports for formatting
let g:go_fmt_command = "goimports"

" no default input
let g:ctrlp_default_input = 0
" set working dir starting at vim's working dir
let g:ctrlp_working_path_mode = 0
let g:ctrlp_mruf_relative = 1
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:100'
let g:ctrlp_prompt_mappings = {
  \ 'ToggleMRURelative()': ['<c-w>'],
  \ 'PrtDeleteWord()':     ['<F2>']
  \ }
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](local|blib)$'
  \ }
let g:ctrlp_map = '<leader>ff'
noremap <leader>fg :CtrlPRoot<CR>
noremap <leader>fr :CtrlPMRU<CR>
noremap <leader>fl :CtrlPMRU<CR>
noremap <leader>ft :CtrlPTag<CR>
noremap <leader>fb :CtrlPBuffer<CR>
noremap <leader>fc :CtrlPClearCache<CR>
