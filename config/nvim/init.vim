call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
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
Plug 'plasticboy/vim-markdown'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/molokai'
call plug#end()

set bg=dark
" colorscheme Tomorrow-Night
let g:rehash256=1
let g:molokai_original=1
colorscheme molokai

set nocp
set ai to shell=/bin/bash terse nowarn sm ruler sw=4 ts=4
set smartcase

nnoremap j gj
nnoremap k gk

set relativenumber
set cursorline

let mapleader = ','
let maplocalleader = ","

" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_tomorrow'

"""
""" Visually indicate long columns
""" Taken from https://www.youtube.com/watch?v=aHm36-na4-4
""" TODO only for python maybe? Really annoying for markdown, etc
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)

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
" au FileType go setlocal foldmethod=syntax
" use goimports for formatting
let g:go_fmt_command = "goimports"
let g:go_fold_enable = ['import']

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


" Recommended settings for coc.vim
"
" " if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
