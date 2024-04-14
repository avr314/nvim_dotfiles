vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<C-}>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<C-{>', '<Plug>(copilot-previous)')
