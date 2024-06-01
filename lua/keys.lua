vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('c', '<C-d>', '<C-c>')

-- LSP Diagnostics
vim.keymap.set('n', '<C-PageDown>', ':ToggleDiagOn<CR>')
vim.keymap.set('n', '<C-PageUp>', ':ToggleDiagOff<CR>')

-- nvim tree toggle
vim.keymap.set('n', '<C-s>', function() require('nvim-tree.api').tree.toggle() end)

-- Within buffer
vim.keymap.set('n', 'zz', ':update<CR>')
vim.keymap.set('n', '<C-q>', ':bd<CR>')
vim.keymap.set('n', '<S-k>', '{')
vim.keymap.set('n', '<S-j>', '}')

-- Next/previous buffer
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', '<S-Right>', ':bnext<CR>')
vim.keymap.set('n', '<S-h>', ':bprev<CR>')
vim.keymap.set('n', '<S-Left>', ':bprev<CR>')

-- Telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader><space>',
  function()
    -- Can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
     -- winblend = 10,
      previewer = true,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>tf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>th', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>tw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>tg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>td', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Deselect
vim.keymap.set('n', '<CR>', ':noh<CR>', { silent = true })

-- Copilot
vim.keymap.set('n', '<leader>e', ':Copilot enable<CR>')
vim.keymap.set('n', '<leader>d', ':Copilot disable<CR>')
vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<C-}>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<C-{>', '<Plug>(copilot-previous)')

-- CANDIDATES FOR DELETION
--vim.keymap.set('n', 'qq', ':q!')
