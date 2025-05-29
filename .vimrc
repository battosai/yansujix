" ===========================
" General Settings
" ===========================
syntax on
filetype on

" ===========================
" No extra copy files
" ===========================
set noswapfile
set nobackup

" ===========================
" Line & column numbers
" ===========================
set number

" Highlights the character that goes over the 80char max
highlight ColorColumn ctermbg=white
call matchadd('ColorColumn', '\%81v', 80)

" ===========================
" Indentation
" ===========================
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4

" ===========================
" Search & match
" ===========================
set hlsearch
set showmatch
