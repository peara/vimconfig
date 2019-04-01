let mapleader = " "
call plug#begin('~/.vim/plugins')

" Editor Support
" Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
" Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Language support
" Plug 'Valloric/YouCompleteMe'
" Plug 'Yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'tomlion/vim-solidity'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'

Plug 'ajh17/Spacegray.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'peara/vim-colorschemes'
" Plug 'craigemery/vim-autotag'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'

" Others
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'


" Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'

" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
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
" Plug 'leafgarland/typescript-vim'
" Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" A (not so) minimal vimrc.
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

" Centralize swp files
" set directory   =~/.vim/recovery
set noswapfile

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.
packadd! matchit

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
set nowrap

set splitbelow
set splitright

" change cursor shape
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

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

set numberwidth=5
set nospell
set number relativenumber

" fix when press Esc Shift o fast
set timeout timeoutlen=5000 ttimeoutlen=100

" For easy copy paste with clipboard
set clipboard=unnamedplus

" NERDTree
let g:NERDTreeWinPos = 'left'
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize = 35
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeNatureSort = 1


" FZF
let $FZF_DEFAULT_COMMAND='rg --files'
nmap ' :Buffers<CR>
nmap <leader>p :Files<CR>
nmap <leader>t :Tags<CR>

" CtrlP
" let g:ctrlp_max_height = 20
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/](\.(git|hg|svn)|undo|log|tmp|node_modules)$',
"   \ 'file': '\v\.(exe|so|dll|swp)$',
"   \ 'link': '',
"   \ }
" let g:ctrlp_working_path_mode = 'a'


" better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
highlight ExtraWhitespace ctermbg=red


" Setting ctags for solidity
let g:tagbar_type_solidity = {
    \ 'ctagstype': 'solidity',
    \ 'kinds' : [
        \ 'c:contracts',
        \ 'e:events',
        \ 'f:functions',
        \ 'm:mappings',
        \ 'v:varialbes',
    \ ]
\ }


" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'solidity' : ['solhint']
\}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1


" Session
" let g:session_autoload = 'yes'
" let g:session_autosave = 'yes'
" let g:session_verbose_messages = 0
" let g:session_default_name = getcwd()
" if empty(g:session_default_name)
"     autocmd VimEnter  * OpenSession! g:session_default_name
" endif
" autocmd VimLeavePre  * SaveSession


" Auto-Pair
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsMapCR = 1


" Custom keymap
nnoremap <leader>. :Tags<cr>
nnoremap <leader>w :w<cr>
nnoremap <silent><leader>e :NERDTreeToggle<cr>
nnoremap <leader>a :Rg<Space>
nnoremap <leader>f :ALEFix<cr>
nnoremap <leader>t :TagbarToggle<cr>
nnoremap <silent><leader>h :noh<cr>
nnoremap Q <Nop>

" Lightline
set noshowmode
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']],
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK',
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction


" Custom for language
" autocmd BufRead,BufNewFile   *.sol,*.slb set softtabstop=4 shiftwidth=4
command! SetColors all

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType solidity setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal shiftwidth=8 tabstop=8
au BufNewFile,BufRead *.slb set filetype=solidity


colorscheme spacegray
let g:spacegray_underline_search = 0
let g:spacegray_use_italics = 1
let g:spacegray_low_contrast = 0
hi Normal ctermbg=None
