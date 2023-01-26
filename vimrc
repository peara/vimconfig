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
" Plug 'christoomey/vim-tmux-navigator'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'github/copilot.vim'

" Language support
" Plug 'Yggdroot/indentLine'
" Plug 'tomlion/vim-solidity'
Plug 'pangloss/vim-javascript'
" disable syntax for python
let g:polyglot_disabled = ['python']
Plug 'sheerun/vim-polyglot'

Plug 'ajh17/Spacegray.vim'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Others
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'thinca/vim-localrc'
" Plug 'justinmk/vim-sneak'
Plug 'jnurmine/Zenburn'
Plug 'easymotion/vim-easymotion'

" Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'

" Plug 'w0rp/ale'
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

" " Python
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" load devicons last
Plug 'ryanoasis/vim-devicons'

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
if !has('nvim')
  packadd! matchit
endif

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
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

" NERDTress File highlighting
let g:NERDTreeLimitedSyntax = 1

" Python Path
" let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

" Coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Recently vim can merge signcolumn and number column into one
set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Easymotion config
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>cc  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


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
" files in fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)
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
" let g:ale_sign_warning = '▲'
" let g:ale_sign_error = '✗'
" highlight link ALEWarningSign String
" highlight link ALEErrorSign Title
" let g:ale_sign_column_always = 1
" let g:ale_linters = {
" \   'python': ['pyright'],
" \   'solidity' : ['solhint']
" \}
" let g:ale_fixers = {
" \ 'python': ['yapf'],
" \}
" let g:ale_fix_on_save = 1


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
" nnoremap <leader>f :ALEFix<cr>
" nnoremap <leader>n :ALENextWrap<cr>
nnoremap <leader>t :TagbarToggle<cr>
nnoremap <silent><leader>h :noh<cr>
nnoremap Q <Nop>
nnoremap <Insert> <Nop>
" wipeout current buffer and open last buffer
nnoremap <leader>qq :b#<cr>:bd#<cr>
" tnoremap <Esc> <C-\><C-n>

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

" autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
" function! s:MaybeUpdateLightline()
"   if exists('#lightline')
"     call lightline#update()
"   end
" endfunction


" Custom for language

" autocmd BufRead,BufNewFile   *.sol,*.slb set softtabstop=4 shiftwidth=4
command! SetColors all

autocmd FileType html setlocal shiftwidth=2 tabstop=2
" autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType solidity setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2
autocmd FileType go setlocal shiftwidth=8 tabstop=8
au BufNewFile,BufRead *.slb set filetype=solidity

colorscheme flattened_dark

let g:spacegray_underline_search = 0
let g:spacegray_use_italics = 1
let g:spacegray_low_contrast = 0
hi Normal ctermbg=None
hi CursorLine cterm=NONE ctermbg=NONE
set fillchars=vert:\|" required whitespace
hi Directory guifg=#FF0000 ctermfg=brown
