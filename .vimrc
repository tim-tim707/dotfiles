filetype plugin indent on

syntax on
set t_Co=256
set encoding=utf-8
colorscheme corporation_modified

"visual options"
set number
set relativenumber
set colorcolumn=81

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

"Map arrows to window resize"
nnoremap <LEFT> <C-w>5<
nnoremap <RIGHT> <C-w>5>
nnoremap <UP> <C-w>5+
nnoremap <DOWN> <C-w>5-

"Quickfix commands"
noremap <C-m> :wa<CR>:make<CR>:copen<CR><CR>
noremap <C-j> :cn<CR>
noremap <C-k> :cp<CR>
"Ctrl-m : make ctrl-j / ctrl-k : go to errors"

"File explorer"
nnoremap <C-e> :Lex<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"Status bar"
set laststatus=2 "always on"
set statusline=
set statusline+=\ %F

set statusline+=%= "right side append"
set statusline+=\ %l/%L:%c
set statusline+=\ 

"Auto indent"
map <F7> gg=G<C-o><C-o>
"Makefile"
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0
