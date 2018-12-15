"Basic settings
set ignorecase
set mouse=a
set backspace=2
set ww=b,s,<,>,[,]
set textwidth=160
set bg=dark
set tabstop=2
set shiftwidth=2
set expandtab
set number
set numberwidth=2
set autoindent
set smartindent
syntax on
set t_Co=256
set cul
set hlsearch
set incsearch
hi CursorLine ctermbg=DarkGray guibg=#404040 gui=none cterm=none
set list listchars=tab:»·,trail:·
filetype on
filetype indent on

call plug#begin('~/.vim/plugged')
Plug 'elmcast/elm-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'joshdick/onedark.vim'
call plug#end()

"navigation stuff
nnoremap j gj
nnoremap k gk

"disable auto comment leader insertion
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

"backup dir
set backupdir=~/temp
set dir=~/.vimswap//

"COLORSCHEMES
silent! colo onedark
"colo herald         "low contrast
"colo ir_black      "high contrast

"enable plugins
filetype plugin on
set runtimepath^=~/.vim/bundle/ctrlp.vim

" ctrlp ignored directories
let g:ctrlp_custom_ignore='node_modules\|elm-stuff\|.git'
let g:ctrlp_use_caching = 0

if executable('rg')
  set grepprg=rg\ --vimgrep
endif
