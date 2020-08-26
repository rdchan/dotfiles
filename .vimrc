" --- Auto-install vim-plug if not already installed --- "
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif 

" --- Plugin section --- "
call plug#begin('~/.vim/plugged')


" --- Theming --- "
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'


" --- Completion and syntax --- "

" Editing and usability
Plug 'jiangmiao/auto-pairs'

" --- Programming Languages ---
Plug 'sheerun/vim-polyglot'
"Plug 'davidhalter/jedi-vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
syntax on
" gruvbox italic fix (must appear before colorscheme)
let g:gruvbox_italic = 1
colorscheme gruvbox
" Airline powerline fonts fix
let g:airline_powerline_fonts = 1
" Airline theme
let g:airline_theme = 'gruvbox'

" User-specific Settings.

" ---Sets---
" 
set encoding=utf-8      		" UTF-8 Support
set tabstop=4                   " 4 spaces will do
set shiftwidth=4                " control indentation for >> bind
set expandtab                   " spaces instead of tabs
set autoindent                  " always set autoindenting on
set relativenumber              " relative line numbers
set number                      " hybrid numbering with both rnu and number
"set hidden                      " hide buffers instead of closing them
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if all lowercase
"set nobackup                    " don't need swp files
"set noswapfile                  " don't need swp files
"set showmatch                   " Show matching braces when over one
"set backspace=indent,eol,start  " allow backspacing everything in insert
set hlsearch                    " highlight searches
set incsearch                   " search as typing
"set laststatus=2		        " for lightline.vim plugin
set bg=dark                     " auto dark mode
set wildmenu


" custom bindings
" to insert a blank line above/below the cursor and stay in normal mode
nnoremap  <Enter> o<ESC>
nnoremap  <S-Enter> O<ESC>
