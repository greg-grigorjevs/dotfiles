" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible
filetype plugin indent on

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
" Enter normal mode using dj keys (much more convenient)
inoremap dj <esc>


" Install vim-plug if it is not installed yet
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins 
" NERDTree
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'easymotion/vim-easymotion'
Plug 'othree/html5.vim'
Plug 'vim-airline/vim-airline'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
" Snipmate and snipmate dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug '2072/php-indenting-for-vim'
" Prettier
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
" Themes
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
call plug#end()


"colorscheme gruvbox
colorscheme onedark
colorscheme gruvbox


" Setup
" Disables auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enables autoscrolling near top/bottom
set scrolloff=15

" Set leader to ,
let mapleader="\\"
"let g:mapleader=","

" Auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set nohlsearch  "search highligting

set noshowmatch "Cursor shows mathing braces"
set autoindent "auto indentation"
set smartindent
set nocopyindent "copy the previous indentation on autoindenting"

" MAPINGS
" ===========

" Tab naigation
map <S-J> gT
map <S-K> gt

" New tab
map <C-t><C-t> :tabnew<CR>

noremap <Leader>s :w<CR>
noremap <Leader>ss :wa<CR>
"===========

" Replace tabs with spaces 
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set listchars=space:_,tab:>~ list

" Toggle paste mode on F2
set pastetoggle=<F2>

" Closetag config
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" Emmet config
let g:user_emmet_install_global = 0
autocmd Filetype html,css,php,jsx EmmetInstall
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'html' : {
\    'indentation' : '  '
\  }
\}

" NERDTree config
" Make NERDTree ignore node_modules directory
let NERDTreeIgnore=['^node_modules$', '\.class$'] 
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1 "closes nerdtree after opening a file"
