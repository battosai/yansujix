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
set noshowmode
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

highlight Orange cterm=bold ctermfg=234 ctermbg=209
set statusline+=%#Orange#
set statusline+=%{(mode()=='n')?'\ NORMAL\ ':''}
set statusline+=%{(mode()=='i')?'\ INSERT\ ':''}
set statusline+=%{(mode()=='v')?'\ VISUAL\ ':''}

highlight StatusLine cterm=none ctermfg=245 ctermbg=235
set statusline+=%#StatusLine#
set statusline+=\ %m
set statusline+=%=
set statusline+=%r\ 

highlight Salmon cterm=bold ctermfg=234 ctermbg=132
set statusline+=%#Salmon#
set statusline+=\ %y
set statusline+=[%{&fileencoding?&fileencoding:&encoding}]
set statusline+=[%{&fileformat}]\ 

highlight Purple cterm=bold ctermfg=234 ctermbg=097
set statusline+=%#Purple#
set statusline+=\ [%l\/%L]:%c\ 

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
