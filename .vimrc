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

highlight GitBranch cterm=bold ctermfg=223 ctermbg=203
set statusline+=%#GitBranch#
set statusline+=\ %{b:git_branch}\ 

highlight FileName cterm=bold ctermfg=234 ctermbg=216
set statusline+=%#FileName#
set statusline+=\ %f\ 

highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
set statusline+=%#StatusLine#
set statusline+=\ %m\ %r\ 

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
