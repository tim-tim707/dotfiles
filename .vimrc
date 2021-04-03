filetype plugin indent on

syntax on
set t_Co=256
set encoding=utf-8
colorscheme corporation_modified

"visual options"
set number
set relativenumber
set colorcolumn=80

set linebreak
set textwidth=80
set showbreak=+++
set list listchars=tab:>-,eol:¬,trail:.,nbsp:¤
set backspace=eol,indent,start

set showmatch
set scrolloff=10

"Cursor visual"
set cursorline
let &t_EI.="\e[1 q\e]12;grey\x7" " Edit mode blinking block
let &t_SI.="\e[5 q\e]12;grey\x7" " Insert mode blinking bar xterm
let &t_te.="\e[5 q\e]12;grey\x7" " Terminal blinking bar

"search options"
set smartcase
set ignorecase
set hlsearch
set incsearch

"Tab options"
set expandtab
set autoindent
set cindent
set shiftwidth=4
set smartindent

set smarttab
set tabstop=8
set softtabstop=-1

"Windows options"
set splitbelow
set splitright
set fillchars=vert:│

"command completion"
set wildmenu
set wildmode=longest:full,list:full

"disable automatic comment insertion"
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

map <LEFT> <Nop>
map <RIGHT> <Nop>
map <UP> <Nop>
map <DOWN> <Nop>

"Quickfix commands"
noremap <C-m> :wa<CR>:make<CR>:copen<CR><CR>
noremap <C-j> :cn<CR>
noremap <C-k> :cp<CR>
"Ctrl-m : make ctrl-j / ctrl-k : go to errors"

"Auto indent"
map <F7> gg=G<C-o><C-o>
"Makefile"
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0
