" ===========================
" General Settings
" ===========================
syntax on
filetype on
set showmode
set ruler
set showmatch
set history=1000
set laststatus=2
highlight StatusLine ctermfg=096 ctermbg=221

" ===========================
" No extra copy files
" ===========================
set noswapfile
set nobackup

" ===========================
" Lines & columns
" ===========================
set number
" set cursorline
" set cursorcolumn

set colorcolumn=80
highlight ColorColumn ctermfg=208 ctermbg=096
" Highlights the character that goes over the 80char max
" call matchadd('ColorColumn', '\%81v', 80)

" ===========================
" Indentation
" ===========================
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4

" ===========================
" Visual mode
" ===========================
highlight Visual ctermfg=221 ctermbg=096

" ===========================
" Search
" ===========================
" set hlsearch 
" highlight Search ctermfg=216 ctermbg=054

" ===========================
" Markers
" ===========================
highlight Folded ctermfg=221 ctermbg=096
