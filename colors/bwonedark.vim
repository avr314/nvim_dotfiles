" =============================================================================
" Filename: autoload/lightline/colorscheme/bwonedark.vim
" Author: Michał Góral
" License: MIT License
" =============================================================================

" Common colors
let s:black1 = ['#282c34', 235]
let s:black2 = ['#2C323C', 239]
let s:cream2 = ['#ABB2BF', 230]
let s:gray1 = ['#2C323C', 239]
let s:gray2 = ['#4B5263', 240]
let s:gray3 = ['#5C6370', 241]
let s:gray4 = ['#ECEFF4', 242]
let s:gray5 = ['#3E4452', 250]

let s:blue = ['#61AFEF', 67]
let s:green = ['#98C379', 71]
let s:purple = ['#C678DD', 170]
let s:red1 = ['#E06C75', 124]
let s:red2 = ['#BE5046', 196]
let s:gold = ['#E5C07B', 136]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:fg = s:black1
let s:dimfg = s:gray3
let s:dimbg = s:gray1
let s:tabselfg = s:cream2
let s:tabselbg = s:gray1

let s:shade1 = s:gray3
let s:shade2 = s:gray4
let s:shade3 = s:gray1

let s:p.inactive.left   = [[s:dimfg,  s:dimbg], [s:dimfg, s:dimbg]]
let s:p.inactive.middle = [[s:dimfg, s:dimbg]]
let s:p.inactive.right  = [[s:dimfg, s:dimbg]]

let s:p.normal.left    = [[s:fg, s:shade1, 'bold'], [s:cream2, s:gray5]]
let s:p.normal.middle  = [[s:dimfg, s:dimbg]]
let s:p.normal.right   = [[s:fg, s:shade1, 'bold'], [s:cream2, s:gray5]]
let s:p.normal.error   = [[s:red2, s:fg, 'bold']]
let s:p.normal.warning = [[s:gold, s:fg]]

let s:p.insert.left    = [[s:fg, s:green, 'bold'], [s:cream2, s:gray5]]
let s:p.replace.left    = [[s:fg, s:red2, 'bold'], [s:cream2, s:gray5]]
let s:p.visual.left    = [[s:fg, s:purple, 'bold'], [s:cream2, s:gray5]]

let s:p.tabline.left   = [[s:fg, s:shade1]]
let s:p.tabline.middle = [[s:fg, s:dimbg]]
let s:p.tabline.right  = [[s:fg, s:shade1, 'bold'], [s:fg, s:shade2]]
let s:p.tabline.tabsel = [[s:tabselfg, s:tabselbg, 'bold']]

let g:lightline#colorscheme#bwonedark#palette = lightline#colorscheme#flatten(s:p)
