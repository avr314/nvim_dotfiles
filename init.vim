source ~/.config/nvim/functions.vim
source ~/.config/nvim/vimplug.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/netrw_config.vim
source ~/.config/nvim/treesitter_modules.vim
source ~/.config/nvim/rose_pine_theme.vim

augroup user_colors
    autocmd!
    autocmd ColorScheme * highlight Normal guibg=NONE
augroup END

colorscheme nordfox
let g:airline_theme='transparent'
