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

-- Telescope keymap settings
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    -- winblend = 10,
    previewer = true,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
