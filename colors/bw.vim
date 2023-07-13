" =============================================================================
" Filename: autoload/lightline/colorscheme/bw.vim
" Author: Michał Góral
" License: MIT License
" =============================================================================

" Common colors
let s:black1 = ['#282828', 235]
let s:black2 = ['#3B3B3B', 236]
let s:cream1 = ['#F3F3EF', 255]
let s:cream2 = ['#EBDBB2', 230]
let s:gray1 = ['#615B57', 239]
let s:gray2 = ['#665C64', 240]
let s:gray3 = ['#928374', 241]
let s:gray4 = ['#A89984', 242]
let s:gray5 = ['#D0D0D0', 252]
let s:gray6 = ['#B0B0B0', 249]
let s:gray7 = ['#DDDDDD', 253]
let s:gray8 = ['#EBEBEB', 254]

let s:blue = ['#5F87AF', 67]
let s:green = ['#8EC07C', 71]
let s:purple = ['#D3869B', 175]
let s:red1 = ['#9D0006', 124]
let s:red2 = ['#FB4934', 196]
let s:gold = ['#D79921', 136]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

if lightline#colorscheme#background() ==# 'dark'
    let s:fg = s:black1
    let s:dimfg = s:gray3
    let s:dimbg = s:black2
    let s:tabselfg = s:cream2
    let s:tabselbg = s:gray1

    let s:shade1 = s:gray3
    let s:shade2 = s:gray4
    let s:shade3 = s:gray1
else
    let s:fg = s:black1
    let s:dimfg = s:gray1
    let s:dimbg = s:gray8
    let s:tabselfg = s:black1
    let s:tabselbg = s:gray6

    let s:shade1 = s:gray6
    let s:shade2 = s:gray5
    let s:shade3 = s:gray7
endif


let s:p.inactive.left   = [[s:dimfg,  s:dimbg], [s:dimfg, s:dimbg]]
let s:p.inactive.middle = [[s:dimfg, s:dimbg]]
let s:p.inactive.right  = [[s:dimfg, s:dimbg]]

let s:p.normal.left    = [[s:fg, s:shade1, 'bold'], [s:dimfg, s:dimbg]]
let s:p.normal.middle  = [[s:dimfg, s:dimbg]]
let s:p.normal.right   = [[s:fg, s:shade1, 'bold'], [s:fg, s:shade2]]
let s:p.normal.error   = [[s:red2, s:fg, 'bold']]
let s:p.normal.warning = [[s:gold, s:fg]]

let s:p.insert.left    = [[s:fg, s:green, 'bold'], [s:dimfg, s:dimbg]]
let s:p.replace.left    = [[s:fg, s:red2, 'bold'], [s:dimfg, s:dimbg]]
let s:p.visual.left    = [[s:fg, s:purple, 'bold'], [s:dimfg, s:dimbg]]

let s:p.tabline.left   = [[s:fg, s:shade2]]
let s:p.tabline.middle = [[s:fg, s:shade3]]
let s:p.tabline.right  = [[s:fg, s:shade2, 'bold'], [s:fg, s:shade2]]
let s:p.tabline.tabsel = [[s:tabselfg, s:tabselbg, 'bold']]

let g:lightline#colorscheme#bw#palette = lightline#colorscheme#flatten(s:p)
