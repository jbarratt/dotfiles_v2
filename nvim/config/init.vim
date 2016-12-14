call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-airline'
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
call plug#end()

colorscheme Tomorrow-Night

nnoremap j gj
nnoremap k gk
set relativenumber
set cursorline

autocmd filetype taskpaper let ge:auto_save = 1
autocmd filetype taskpaper :WatchForChanges!
