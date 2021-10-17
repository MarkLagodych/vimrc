" ===================== PLUGINS FOR VIM-PLUG =====================
call plug#begin('~/.vim/vim-plug_plugins')
    " File explorer
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

    " Color theme
    Plug 'morhetz/gruvbox'

    " Autocompletion
    " 1) Install Node.js  2) :PlugInstall  3) :CocCommand clangd.install
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Braces and quotes
    Plug 'jiangmiao/auto-pairs'

    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Fancy file search on Ctrl+P
    Plug 'ctrlpvim/ctrlp.vim'

    " Fancy status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Fancy startup screen
    Plug 'mhinz/vim-startify'
call plug#end()

" ========================== SETTINGS ===========================
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
set clipboard=unnamedplus
set ffs=unix,dos

" ============================ THEME ============================
syntax on
colorscheme gruvbox
set background=dark
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1

" ===================== MAPPINGS, COMMANDS, FUNCTIONS =====================
" Toggle file explorer
nnoremap <C-n> :NERDTreeToggle<CR>

" Exit from terminal (called with :term command)
tnoremap <Esc> <C-\><C-n>

" Scroll up/down without moving cursor
noremap <C-Up> <C-y>
noremap <C-Down> <C-e>

" Buffer navigation
nnoremap <C-,> :bp<CR>
nnoremap <C-.> :bn<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window movement
nnoremap <A-h> <C-w>H
nnoremap <A-j> <C-w>J
nnoremap <A-k> <C-w>K
nnoremap <A-l> <C-w>L

" Delete lines in INSERT mode
inoremap <C-x> <Esc>ddi

" Ctrl+Z like in normal editors
inoremap <C-z> <Esc>ui

" Empty line insetion
" Lower
nnoremap f o<Esc>k
inoremap <C-s> <Esc>o
" Upper
nnoremap F O<Esc>j
inoremap <C-d> <Esc>O
" Build and run project
inoremap <C-CR> <C-[>:w<CR><C-w><C-l><C-w><C-j>i./.build && ./.run<CR>
nnoremap <C-CR> <C-w><C-l><C-w><C-j>i./.build && ./.run<CR>
" Escape from terminal and return to editing
tnoremap <C-q> <C-\><C-n><C-w><C-h>i

" Select text
inoremap <S-Right> <Esc><Right><C-v><Right>
inoremap <S-Left>  <Esc><C-v><Left>

" ========================= SPECIAL ==========================
" Use tabs for Makefile (oh yes, it requires tabs)
autocmd FileType make setlocal noexpandtab

" Do not list terminals as buffers
autocmd TermOpen * setlocal nobuflisted

" Specify coc.nvim extensions
let g:coc_global_extensions=['coc-clangd', 'coc-dlang']

" Configure airline
let g:airline_powerline_fonts = 1 " Install fonts-powerline for this
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = '#'
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_section_x='%{substitute(toupper(&ft[0]).&ft[1:],"Cpp","C++","")}'
