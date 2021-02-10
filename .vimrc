"--- Auto-install vim-plug if not already installed --- "
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

" --- NERD Tree ---
Plug 'scrooloose/nerdtree'
nnoremap <C-n>  :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif


" --- LaTeX Suite ---
Plug 'wchargin/vim-latexsuite', {'for': 'tex' }
let g:Tex_DefaultTargetFormat = 'pdf'

autocmd BufWritePost *.tex silent call Tex_RunLaTeX()
map <leader>ls :silent call Tex_RunLaTeX()

" --- YCM Code Completion (trying for nice snippets, needs aur pkg too
Plug 'valloric/youcompleteme'
let g:ycm_global_ycm_extra_conf = '/path/to/the/file'
let g:ycm_confirm_extra_conf = 0

" --- Snippets (trying for tex snippets, using UltiSnips engine with snippets
"  from honza)
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" make YCM compatible with UltiSnips (using supertab)
Plug 'ervandew/supertab'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_use_ultisnips_completer = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"for highlighting hex codes, color names, and rgb profiling in the proper color
Plug 'ap/vim-css-color'
" Included last for NERDTree icons to be included on a file granularity basis
Plug 'ryanoasis/vim-devicons'
"Initialize plugin system
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

" for latex
let g:tex_flavor='latex'

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
set nobackup                    " don't need swp files
set noswapfile                  " don't need swp files
"set showmatch                   " Show matching braces when over one
"set backspace=indent,eol,start  " allow backspacing everything in insert
set hlsearch                    " highlight searches
set incsearch                   " search as typing
"set laststatus=2		        " for lightline.vim plugin
set bg=dark                     " auto dark mode
set wildmenu
set mouse=a
" set spell check in en_us for tex documents only
autocmd FileType tex setlocal spell spelllang=en_us

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
"for copying to x clipboard because it's dumb
"I wish all yanks could go to xclipboard
vmap <C-c> :!xclip -f -sel clip<CR>
