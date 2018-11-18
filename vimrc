call plug#begin('~/.vim/plugins')

" Editor Support
" Plug 'Valloric/YouCompleteMe'
" Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
" Plug 'jiangmiao/auto-pairs'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'mattn/emmet-vim'
" Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" " Language Supports
"
" " Ruby
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-endwise'
"
" " CSS/SCSS
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'hail2u/vim-css3-syntax'
"
" " Javascript/Typescript
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'mxw/vim-jsx'

call plug#end()

" A (not so) minimal vimrc.
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

" Centralize swp files
set directory   =~/.vim/recovery

colorscheme hotpot
filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 4 spaces.
set shiftwidth  =2         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

set wildmenu
set wildignorecase
set wildignore=*.o,*~,*.pyc,*.bak,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/node_modules/**

set path+=**
set scrolloff=5
set number
set nospell

" NERDTree

let g:NERDTreeWinPos = 'left'
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize = 35
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeNatureSort = 1

" Vim-Airline

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

" CtrlP

let g:ctrlp_max_height = 20
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|undo|log|tmp|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|swp)$',
  \ 'link': '',
  \ }
let g:ctrlp_working_path_mode = 'a'

" better-whitespace

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
highlight ExtraWhitespace ctermbg=red

