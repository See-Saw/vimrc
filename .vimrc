syntax on
set nu
set mouse=a

set nocompatible              

set cin nu ts=4 sw=4 sts=4 mouse=a cul

set background=dark

hi Normal guibg=NONE ctermbg=NONE
set fdm=marker

"光标
set guicursor=i-ci:hor50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => General
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Sets how many lines of history VIM has to remember
 set history=500

 " Enable filetype plugins
 filetype plugin on
 filetype indent on

 " Set to auto read when a file is changed from the outside
 set autoread

 " Fast saving
 nmap <leader>w :w!<cr>

 " :W sudo saves the file
 " (useful for handling the permission-denied error)
 command W w !sudo tee % > /dev/null

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => VIM user interface
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Set 7 lines to the cursor - when moving vertically using j/k
 set so=7
" Configure backspace so it acts as it should act
 set backspace=eol,start,indent
 set whichwrap+=<,>,h,l

 " Ignore case when searching
 set ignorecase

 " When searching try to be smart about cases
 set smartcase

 " Highlight search results
 set hlsearch

 " Makes search act like search in modern browsers
 set incsearch

 " Don't redraw while executing macros (good performance config)
 set lazyredraw

 " For regular expressions turn magic on
 set magic
 " Set utf8 as standard encoding and en_US as the standard language
 set encoding=utf8

 " Use Unix as the standard file type
 set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Text, tab and indent related
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Use spaces instead of tabs
 set expandtab

 " Be smart when using tabs ;)
 set smarttab

 " 1 tab == 4 spaces
 set shiftwidth=4
 set tabstop=4

 " Linebreak on 500 characters
 set lbr
 set tw=500

 set ai "Auto indent
 set si "Smart indent
 set wrap "Wrap lines6

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'solarnz/thrift.vim'
Plugin 'w0rp/ale'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-gitgutter'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()            

filetype plugin indent on    

colorscheme gruvbox

" NERDTree config
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"map F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"vim-airline-themes
let g:airline_theme='bubblegum'

"ag.vim
let g:ag_working_path_mode="r"

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
" 相当于mru功能，show recently opened files
map <leader>fp :CtrlPMRU<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 0
nmap <F3> :TagbarToggle<CR>


" Asynchronous Lint Engine
let g:ale_linters = {
  \'c': [],
  \'cpp': [],
  \'rust': ['rustc', 'cargo'],
  \'python': ['flake8'],
  \}
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_on_text_exchanged = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s'

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Files, backups and undo
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Turn backup off, since most stuff is in SVN, git et.c anyway...
 set nobackup
 set nowb
 set noswapfile

