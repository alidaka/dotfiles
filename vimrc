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

"navigation stuff
nnoremap j gj
nnoremap k gk

"disable auto comment leader insertion
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

"backup dir
set backupdir=~/tmp
set dir=~/.vimswap//

"COLORSCHEMES
colo wombat256     "low contrast, good in MathLAN
"colo herald         "low contrast
"colo ir_black      "high contrast

"enable plugins
filetype plugin on
set runtimepath^=~/.vim/bundle/ctrlp.vim

map <C-n> :NERDTreeToggle<CR>

"add some custom HTML indentation tags
let g:html_indent_inctags="html,body,head,tbody,meta"

"Custom functions
function StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<CR>
        normal `z
    endif
endfunction

execute pathogen#infect()
