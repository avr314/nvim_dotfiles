vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', 'zz', ':update<CR>')
vim.keymap.set('n', 'qq', ':q!')
vim.keymap.set('n', '<C-Right>', ':bnext<CR>')
vim.keymap.set('n', '<C-l>', ':bnext<CR>')
vim.keymap.set('n', '<C-Left>', ':bprev<CR>')
vim.keymap.set('n', '<C-h>', ':bprev<CR>')
vim.keymap.set({'i', 'v'}, '<C-d>', '<Esc>')
vim.keymap.set('n', '<C-E>', ':E<CR>')
vim.keymap.set('n', '<S-k>', '{')
vim.keymap.set('n', '<S-j>', '}')
vim.keymap.set('n', '<S-Up>', '{')
vim.keymap.set('n', '<S-Down>', '}')

-- LSP Diag
vim.keymap.set('n', '<C-PageDown>', ':ToggleDiagOn<CR>')
vim.keymap.set('n', '<C-PageUp>', ':ToggleDiagOff<CR>')

-- Tree toggle
vim.keymap.set('n', '<C-s>', function() require('nvim-tree.api').tree.toggle() end)

-- Close buffer
vim.keymap.set('n', '<C-q>', ':bd<CR>')

-- Pane navigation 
vim.keymap.set('n', '<S-Up>', '<C-w><Up>')
vim.keymap.set('n', '<S-Down>', '<C-w><Down>')
vim.keymap.set('n', '<S-Right>', '<C-w><Right>')
vim.keymap.set('n', '<S-Left>', '<C-w><Left>')
