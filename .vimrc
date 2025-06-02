" Colors https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

" ===========================
" General Settings
" ===========================
syntax on
filetype on
set history=1000
set ruler
set noshowmode
set showmatch
set noswapfile
set nobackup
set shortmess+=F

highlight Visual cterm=bold ctermfg=none ctermbg=238
highlight Error cterm=bold ctermfg=196 ctermbg=235
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
set statusline+=\ %{b:git_branch}\ %f\ 
    
highlight Orange cterm=bold ctermfg=234 ctermbg=209
set statusline+=%#Orange#
set statusline+=%{(mode()=='n')?'\ NORMAL\ ':''}
set statusline+=%{(mode()=='i')?'\ INSERT\ ':''}
set statusline+=%{(mode()=='v')?'\ VISUAL\ ':''}
set statusline+=%{(mode()=='V')?'\ VISUAL\ ':''}
set statusline+=%{(mode()=='c')?'\ COMMAND\ ':''}
set statusline+=%{(mode()=='R')?'\ REPLACE\ ':''}
set statusline+=%{(mode()=='Rv')?'\ REPLACE\ ':''}

highlight StatusLine cterm=none ctermfg=245 ctermbg=235
set statusline+=%#StatusLine#
set statusline+=\ %m
set statusline+=%=
set statusline+=%r\ 

highlight Salmon cterm=bold ctermfg=234 ctermbg=132
set statusline+=%#Salmon#
set statusline+=\ %y
highlight SalmonNormal cterm=none ctermfg=234 ctermbg=132
set statusline+=%#SalmonNormal#
set statusline+=[%{&fileencoding?&fileencoding:&encoding}]
set statusline+=[%{&fileformat}]\ 

highlight Purple cterm=bold ctermfg=234 ctermbg=097
set statusline+=%#Purple#
set statusline+=\ [%l\/%L]:%c\ 

" ===========================
" Statusline functions
" ===========================
function! GitBranch()
    let branch = trim(system("git -C " . expand("%:h") . " branch --show-current 2>/dev/null"))
    if !empty(branch)
        let branch = (" " . branch . " ")
    endif
    return branch
endfunction

augroup GetGitBranch
    autocmd!
    autocmd BufEnter * let b:git_branch = GitBranch()
augroup END
