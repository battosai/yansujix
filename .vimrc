" ===========================
" General Settings
" ===========================
syntax on
filetype on
set showmode
set ruler
set showmatch
set history=1000
set noswapfile
set nobackup

highlight Visual cterm=bold ctermfg=none ctermbg=238
highlight ErrorMsg cterm=bold ctermfg=196 ctermbg=235
highlight Folded cterm=bold ctermfg=255 ctermbg=238

" ===========================
" Lines & columns
" ===========================
highlight LineNr cterm=none ctermfg=239
set number

highlight ColorColumn cterm=none ctermbg=235
set colorcolumn=80

" ===========================
" Indentation
" ===========================
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4

" ===========================
" Search
" ===========================
" set hlsearch 
" highlight Search ctermfg=216 ctermbg=054

" ===========================
" Statusline 
" ===========================
set laststatus=2
set statusline=

highlight BrightOrange cterm=bold ctermfg=234 ctermbg=216
set statusline+=%#BrightOrange#
set statusline+=\ [%{b:git_branch}][%f]\ 

highlight Orange cterm=none ctermfg=234 ctermbg=209
set statusline+=%#Orange#
set statusline+=\ %m%y%r\ 

highlight StatusLine cterm=none ctermfg=245 ctermbg=235
set statusline+=%#StatusLine#
set statusline+=\ %m\ 

highlight Salmon cterm=bold ctermfg=234 ctermbg=132
set statusline+=%=
set statusline+=%#Salmon#
set statusline+=\ test\ 

highlight Purple cterm=bold ctermfg=234 ctermbg=097
set statusline+=%#Purple#
set statusline+=\ test\ 

" ===========================
" Statusline functions
" ===========================o
function! GitBranch()
    return trim(system("git -C " . expand("%:h") . " branch --show-current 2>/dev/null"))
endfunction

augroup GetGitBranch
    autocmd!
    autocmd BufEnter * let b:git_branch = GitBranch()
augroup END
