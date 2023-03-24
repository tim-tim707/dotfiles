if empty (glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin indent on
syntax on
set t_Co=256
set encoding=utf-8

colorscheme corporation_modified

"
" Plugins
"
call plug#begin('~/.vim/plugged')

" Quality of life
source $HOME/.vim/plugged/utils.vim
Plug 'jiangmiao/auto-pairs'

" Let vim follow symlinks
Plug 'moll/vim-bbye' " optional dependency
Plug 'aymericbeaumet/vim-symlink'"
" Tags
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_project_root = ['Makefile']


" Clang format
Plug 'rhysd/vim-clang-format'
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:clang_format#command = "clang-format-12"

Plug 'tpope/vim-fugitive'

Plug 'vim-utils/vim-man'
noremap <leader><S-M> <Plug>(Vman)
call plug#end()

packadd termdebug
let g:termdebug_popup = 0
let g:termdebug_wide = 163

"
" Settings
"

set mouse=a

"visual options"
set number
set relativenumber
set colorcolumn=81

set linebreak
set textwidth=80
set showbreak=+++
" set list listchars=tab:>-,eol:¬,trail:.,nbsp:¤
set list listchars=tab:>-,trail:.,nbsp:¤
set backspace=eol,indent,start

set showmatch
set scrolloff=5

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

"Status bar"
set laststatus=2 "always on"
set statusline=
set statusline+=\ %F

set statusline+=%= "right side append"
set statusline+=\ %l/%L\ :\ %c
set statusline+=\ 

"Miscellaneous"
set noswapfile
set path+=**
set autoread
set autowrite
autocmd FocusGained,BufEnter * :checktime

"disable automatic comment insertion when using o/O"
autocmd FileType * setlocal formatoptions-=o

"
" Remappings
"

let mapleader = "\<Space>"

" nnoremap <Leader>cf :call utils#CreateFunctionFromDefinition()<CR>
nnoremap <Leader>cf :ClangFormat <CR> :wa <CR>
autocmd FileType c ClangFormatAutoEnable
nnoremap <Leader>ch :call utils#CreateHeaderAndSrc()<CR>
nnoremap <Leader>c :call Clean()<CR>

"Map arrows to window resize"
nnoremap <LEFT> <C-w>5<
nnoremap <RIGHT> <C-w>5>
nnoremap <UP> <C-w>5+
nnoremap <DOWN> <C-w>5-

"Map to window movement"
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Quickfix commands"
nnoremap <C-m> :wa<CR>:make<CR>:copen<CR><CR>
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>
"Ctrl-m : make ctrl-j / ctrl-k : go to errors"

"File explorer"
nnoremap <C-e> :Lex<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"Auto indent"
noremap <F7> gg=G<C-o><C-o>

" Move lines with Shift UP/DOWN arrows on xterm
if ($TERM =~? 'xterm')
    nnoremap <S-UP> :m .-2<CR>
    nnoremap <S-DOWN> :m .+1<CR>
endif

" quick save on CTR-S
if ($TERM =~? 'rxvt')
    nnoremap <C-S> :wa<CR>
endif

command WQ wq
command Wq wq
command W w
command Q q

" File Type local options
"

"Makefile"
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0

"C files options"
autocmd FileType c,cpp setlocal path+=/usr/include include &
