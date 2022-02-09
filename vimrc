" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Declare plugins
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'morhetz/gruvbox'
" Initialize plugin system
call plug#end()

" Gruvbox setup
autocmd vimenter * ++nested colorscheme gruvbox

" Let NerdTree file explorer show hidden files
let NERDTreeShowHidden=1

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable line numbers
:set relativenumber

" Better command-line completion
set wildmenu

" Map leader key to '
let mapleader = "'"

" Set spellchecker to US English
" set spell spelllang=eu_us

" Show partial commands in the last line of the screen
set showcmd

" Remap jk to ECS
inoremap jk <ESC>

set noswapfile " disable the swapfile
set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type

" Set default tab to 2 spaces (all files)
set tabstop=2
set shiftwidth=2
set expandtab

