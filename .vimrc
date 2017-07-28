if has("autocmd")
  autocmd! bufwritepost .vimrc source ~/.vimrc
endif
let vimDir = $HOME.'/.vim'
let &runtimepath.=','.vimDir
set undolevels=1000
set undoreload=10000
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
if has('python3')
    let g:gundo_prefer_python3 = 1 " anything else breaks on Ubuntu 16.04+
endif"
set nocompatible " be iMproved, required
if !has('nvim') " no need for that with neovim
  " Copy to X CLIPBOARD
  map <leader>yc :w !xsel -i -b<CR>
  map <leader>yp :w !xsel -i -p<CR>
  map <leader>ys :w !xsel -i -s<CR>
  " Paste from X CLIPBOARD
  map <leader>pp :r!xsel -p<CR>
  map <leader>ps :r!xsel -s<CR>
  map <leader>pb :r!xsel -b<CR>
endif
set autoread
au CursorHold * checktime
set cursorline
set showcmd
set hidden
set list
set title
set modelines=0
set ruler
set wrap
" set textwidth=99
set formatoptions=qrn1
" set colorcolumn=105
set scrolloff=3
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set visualbell
set number
set relativenumber
set noerrorbells
set noswapfile
set completeopt=longest,menuone
set backspace=indent,eol,start
set mouse=a
if !has('nvim')
  set ttymouse=sgr
endif
if has('nvim')
  set clipboard+=unnamedplus
endif
set foldmethod=syntax
set nofoldenable
filetype off " required
set t_Co=256
syntax enable
" always split windows vertically
set splitright
set splitbelow
set diffopt+=vertical
silent! set splitvertical
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
let mapleader=" "
inoremap jk <ESC>
vnoremap jk <ESC>
cnoremap jk <ESC>
onoremap jk <ESC>
set encoding=utf-8
set updatetime=250
nnoremap <tab> %
vnoremap <tab> %
vnoremap <tab> %
" duplicate line
" nmap <leader>d mzyyp`zgj
" use Enter to insert a blank line...
nmap <CR> ojk
" ...but still use Enter to navigate in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Lib
Plugin 'L9'

" Working with tags (HTML/JSX)
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-ragtag'

" Misc
Plugin 'matchit.zip'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-sensible'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
Plugin 'ConradIrwin/vim-bracketed-paste'

" Motions
Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <leader>g <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
Plugin 'chaoren/vim-wordmotion'
let g:wordmotion_prefix = ','
Plugin 'vim-scripts/ReplaceWithRegister'

" Snippets
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'

" Completion
Plugin 'ajh17/VimCompletesMe'
"Plugin 'ervandew/supertab'
"Plugin 'Valloric/YouCompleteMe'

" make YCM compatible with SnipMate (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" Undo
Plugin 'simnalamburt/vim-mundo'
nnoremap <leader>u :MundoToggle<CR>
" Plugin 'sjl/gundo.vim'
" nnoremap <leader>u :GundoToggle<CR>

" Git
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-git'
" Plugin 'gitv'
Plugin 'airblade/vim-gitgutter'

" Files
Plugin 'scrooloose/nerdtree'
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
Plugin 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreeTabsToggle<CR>

Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<Leader>p'
noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>r :CtrlPMRU<CR>
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
""let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|node_modules'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
" nnoremap <leader>f :grep! -F <C-r>=expand('<cword>')<CR><CR>
Plugin 'moll/vim-bbye'
"Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plugin 'junegunn/fzf.vim'
"let g:fzf_layout = { 'down': '~40%' }
"nnoremap <leader>p :Files<cr>
"nnoremap <leader>r :Buffers<cr>

" Search
if executable('rg')
  set grepprg=rg\ no-heading\ --vimgrep
  let g:ctrlp_user_command = 'rg %s --files --hidden -g ""'
  let g:ctrlp_use_caching = 0
endif
Plugin 'mhinz/vim-grepper'
let g:grepper = {}
let g:grepper.tools = ['rg']
let g:grepper.prompt = 1
let g:grepper.highlight = 0
" remove ignore-case from defaults
let g:grepper.rg = { 'grepprg': 'rg --no-heading --vimgrep' }
" backslash for Grepper
" vmap gs <Plug>(GrepperOperator)
" nmap gs <Plug>(GrepperOperator)
" :Rg or double-backslash for Grepper command
command! -nargs=+ -bang -complete=file Rg GrepperRg <args>
" Leader+f prompts for search
nmap <leader>f :Rg<Space>-g<Space>"!tags"<Space>-i<Space>
" Leader+F searches word
nnoremap <leader>F :GrepperRg<Space>-g<Space>"!tags"<Space><cword><CR>

" Plugin 'ironhouzi/vim-stim'
Plugin 'osyo-manga/vim-anzu'
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
nmap <leader>/ :noh<CR><Plug>(anzu-clear-search-status)
Plugin 'terryma/vim-multiple-cursors'

" Theme
Plugin 'morhetz/gruvbox'
set background=dark
set shortmess+=c
colorscheme gruvbox
hi def link jsObjectKey Identifier

" Syntax
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

if has('nvim')
  Plugin 'w0rp/ale'
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 1
  let g:ale_lint_on_enter = 1
  let g:ale_fix_on_save = 1
  let g:ale_sign_column_always = 1
  let g:ale_php_phpcs_standard = 'PSR2'
  let g:ale_linters = {
  \     'php': ['phpcs'],
  \     'javascript': ['eslint']
  \}
  let g:ale_fixers = {
  \     'javascript': ['prettier', 'eslint'],
  \}
  let g:ale_javascript_prettier_options = '--tab-width 4 --trailing-comma es5'
  nmap <silent> <leader>a <Plug>(ale_previous_wrap)
  nmap <silent> <leader>q <Plug>(ale_next_wrap)
  nmap <silent> <leader>d <Plug>(ale_detail)
endif
nmap <leader>pf :silent! !phpcbf "%" --standard=PSR2<CR>

if !has('nvim')
  Plugin 'scrooloose/syntastic'
  " " SignColumn is only supported in Vim 8.0
  " set signcolumn=yes
  " " So I'm using this 'hack' meanwhile
  sign define dummy
  autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_loc_list_height = 5
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0
  " let g:syntastic_javascript_checkers = ['eslint']
  " let g:syntastic_javascript_eslint_exec = 'node_modules/.bin/eslint'
  " let g:syntastic_javascript_eslint_exec = 'eslint_d'
  " let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
  " let g:syntastic_filetype_map = { 'styled-components': 'javascript' }
  let g:syntastic_error_symbol = '❌'
  let g:syntastic_warning_symbol = '⚠️'
  let g:syntastic_style_error_symbol = '⁉️'
  let g:syntastic_style_warning_symbol = '💩'
endif
Plugin 'flowtype/vim-flow'
Plugin 'sheerun/vim-polyglot'
let g:javascript_plugin_flow = 1
" au BufNewFile,BufRead *.js.flow set filetype=javascript.jsx
Plugin 'elmcast/elm-vim'
let g:polyglot_disabled = ['elm']
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_make_show_warnings = 1
let g:ycm_semantic_triggers = {
\ 'elm' : ['.'],
\}
" Plugin 'mattn/emmet-vim', { 'for': ['html','javascript', 'javascript.jsx'] }
Plugin 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plugin 'othree/javascript-libraries-syntax.vim'
" let g:used_javascript_libs = 'react,flux,underscore'
" Plugin 'fleischie/vim-styled-components'
Plugin 'nelsyeung/twig.vim'

Plugin 'romainl/vim-qf'
if !has('nvim')
  nmap <leader>q <Plug>QfLprevious
  nmap <leader>a <Plug>QfLnext
endif
nmap <leader>z <Plug>QfCprevious
nmap <leader>s <Plug>QfCnext
nmap ç <Plug>QfSwitch
nmap <F5> <Plug>QfCtoggle
nmap <F6> <Plug>QfLtoggle

" Test
" Plugin 'janko-m/vim-test'
" inoremap <F12> , () => {<CR>});<Esc>O<Tab>
" let g:test#javascript#mocha#file_pattern = 'Spec\.js'
" let g:test#javascript#mocha#executable = './node_modules/.bin/mocha --opts spec/mocha.opts'

" Statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline_mode_map = {
    \ '__' : '__',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'VL',
    \ '' : 'VB',
    \ 's'  : 's',
    \ 'S'  : 'S',
    \ '' : '^S',
    \ }

" Ctags
Plugin 'craigemery/vim-autotag'
Plugin 'Tagbar'

" Format
" Plugin 'Chiel92/vim-autoformat'
" noremap <F3> :Autoformat<CR>

Plugin 'Yggdroot/indentLine'
" Plugin 'thaerkh/vim-indentguides'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'alvan/vim-closetag'
let g:closetag_filenames = "*.html, *.js, *.twig"
"
" " Whitespace
Plugin 'ShowTrailingWhitespace'
Plugin 'DeleteTrailingWhitespace'
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" Match parens
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 0
nnoremap <leader>( :RainbowToggle<CR>

" Invisible characters
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:~,nbsp:¤,extends:>,precedes:<
set showbreak=↪

" Sessions
Plugin 'mhinz/vim-startify'
function! s:sy_add_bookmark(bookmark)
  if !exists('g:startify_bookmarks')
    let g:startify_bookmarks = []
  endif
  let g:startify_bookmarks += [ a:bookmark ]
endfunction
command! -nargs=1 StartifyAddBookmark call <sid>sy_add_bookmark(<q-args>)

let g:startify_list_order = ['sessions', 'bookmarks', 'files', 'dir',
  \ 'commands']
let g:startify_bookmarks = []
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort = 1

call vundle#end()            " required

nnoremap j gj
nnoremap k gk
nnoremap <C-J> :wincmd j<CR>
nnoremap <C-K> :wincmd k<CR>
nnoremap <C-L> :wincmd l<CR>
nnoremap <C-H> :wincmd h<CR>
nnoremap = <C-W>=
nnoremap - <C-W><
nnoremap + <C-W>>
noremap <C-PageUp> :bp<CR>
noremap <C-PageDown> :bn<CR>
nnoremap <C-C> :Bdelete<CR>
" nnoremap gfv :vertical wincmd f<CR>

filetype off
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:airline_section_c = '%{strftime("%Hh%M")}'
let g:airline_section_x = airline#section#create_right(['%l:%c (%P)'])
let g:airline_section_y = '%f'
let g:airline_section_z = ''
set autowriteall
au WinLeave,BufLeave,FocusLost * silent! wall
