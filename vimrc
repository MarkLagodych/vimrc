" Commands for Vim-Plug plugins manager
call plug#begin('~/.vim/vim-plug_plugins')
    " File explorer
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

    " Color theme
    Plug 'morhetz/gruvbox'

    " ===== Autocompletion =====
    " Needs additional compilation: cd <plugindir> && python3 install.py --clangd-completer
    Plug 'valloric/youcompleteme'
    " Braces and quotes
    Plug 'jiangmiao/auto-pairs'

    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Fancy file search on Ctrl+P
    Plug 'ctrlpvim/ctrlp.vim'

    " Fancy status line
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Fancy startup screen
    Plug 'mhinz/vim-startify'
call plug#end()

" ===== SETTINGS =====
set number
set ai
set wrap
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set hlsearch
set incsearch
set backspace=indent,eol,start
set modifiable
" Fixed an issue of slow transition from INSERT to NORMAL mode
set timeoutlen=1000 ttimeoutlen=0

" ===== THEME =====
syntax on
colorscheme gruvbox
set background=dark
let g:airline_theme='powerlineish'

" ===== MAPPINGS, COMMANDS, FUNCTIONS =====
" Toggle file explorer
map <C-n> :NERDTreeToggle<CR>
" Exit from terminal (called with :term command)
tnoremap <Esc> <C-\><C-n>
" Open buffer in a split
command! -nargs=1 Vb :vsplit | b <args>
command! -nargs=1 Hb :split | b <args>
" Scroll up/down without moving cursor
noremap <C-Up> <C-y>
noremap <C-Down> <C-e>

" ===== SPECIAL =====
" Use tabs for Makefile (oh yes, it requires tabs)
autocmd FileType make setlocal noexpandtab

