"Set up folders"
set undodir=$HOME/.vim/tmp/undo
set backupdir=$HOME/.vim/tmp/backup
set directory=$HOME/.vim/tmp/swap

" Make those folders if they don't exist"
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

"Leading spaces. Default = ^"
let g:indentLine_leadingSpaceEnabled = 0

"Enable fonts for decorative airline"
let g:airline_powerline_fonts = 0

"Airline tabline"
let g:airline#extensions#tabline#enabled=1

let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#whitespace#enabled=0
"Leader key"
let mapleader = "\<Space>"
