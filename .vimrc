filetype plugin indent on

colorscheme corporation_modified
"set t_Co=256"

"visual options"
set number
set colorcolumn=81

set linebreak
set showbreak=+++

set showmatch

"Quality of life options"
set scrolloff=10

"search options"
set smartcase
set ignorecase

"Tab options"
set expandtab
set autoindent
set cindent
set shiftwidth=4
set smartindent

set smarttab
set tabstop=4
set softtabstop=4

"Windows options"
set splitbelow
set splitright

"disable automatic comment insertion"
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

map <LEFT> <Nop>
map <RIGHT> <Nop>
map <UP> <Nop>
map <DOWN> <Nop>

"Auto indent"
map <F7> gg=G<C-o><C-o>
 "Makefile"
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0
