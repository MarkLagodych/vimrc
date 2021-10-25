" ===================== PLUGINS FOR VIM-PLUG =====================
call plug#begin('~/.vim/vim-plug_plugins')
    " File explorer
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

    " Color theme
    Plug 'morhetz/gruvbox'

    " Autocompletion
    " Install Node.js for coc!!!
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Braces and quotes
    Plug 'jiangmiao/auto-pairs'

    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Fancy file search on Ctrl+P
    Plug 'ctrlpvim/ctrlp.vim'

    " Fancy status line
    " Install airline-fonts to make it look nice!!!
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Fancy startup screen
    Plug 'mhinz/vim-startify'

    " ======= Language support ========
    " OpenGL shader language (GLSL)
    Plug 'tikhomirov/vim-glsl'
    " Toml (Cargo config files)
    Plug 'cespare/vim-toml', { 'branch': 'main' }
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

" Exit to NORMAL mode and save
inoremap <C-w> <Esc>:w<CR>

" Empty line insetion
" Below
nnoremap f o<Esc>k
inoremap <C-s> <Esc>o
" Above
nnoremap F O<Esc>j
inoremap <C-d> <Esc>O

" Move lines
nnoremap , :m.-2<CR>
nnoremap . :m.+1<CR>

" Build and run project
" This needs some preparation, for example:
" $ echo "cargo run" > ./.run
" $ echo "cargo check" > ./.check
" $ chmod +x ./.run
" $ chmod +x ./.check
nnoremap <F12> :!./.run<CR>
nnoremap <F9> :!./.check<CR>
inoremap <F12> <Esc>:w<CR>:!./.run<CR>
inoremap <F9> <Esc>:w<CR>:!./.check<CR>

" Escape from terminal on the right and return to editing
tnoremap <C-q> <C-\><C-n><C-w><C-h>i

" Select text in INSERT mode
inoremap <S-Right> <Esc><Right><C-v><Right>
inoremap <S-Left>  <Esc><C-v><Left>

" ========================= SPECIAL ==========================
" Use tabs for Makefile (oh yes, it requires tabs)
autocmd FileType make setlocal noexpandtab

" Do not list terminals as buffers
autocmd TermOpen * setlocal nobuflisted

" Specify coc.nvim extensions
" For C/C++ clang completer:
"   1) :CocCommand clangd.install
" For Rust language server (rls):
"   1) Install rustup
"   2) $ rustup component add rls rust-analysis rust-src
"   3) Logout, login 
"   4) Make sure that **/.cargo/bin is in your path
let g:coc_global_extensions=['coc-clangd', 'coc-dlang', 'coc-rls']

" Configure airline
let g:airline_powerline_fonts = 1 " Install fonts-powerline for this

" Replace ugly symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = '#'
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.notexists = '?'

" Display language name with first capital letter
" And show "C++", not that creepy "Cpp"
let g:airline_section_x='%{substitute(toupper(&ft[0]).&ft[1:],"Cpp","C++","")}'
