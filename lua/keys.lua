vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', 'zz', ':update<CR>')
vim.keymap.set('n', '<C-x><C-c>', ':q<CR>')


vim.keymap.set('n', 'qq', ':q!')
-- vim.keymap.set({'i', 'v', 'n'}, '<C-d>', '<Esc>')
vim.keymap.set('c', '<C-d>', '<C-c>')

-- LSP Diag
vim.keymap.set('n', '<C-PageDown>', ':ToggleDiagOn<CR>')
vim.keymap.set('n', '<C-PageUp>', ':ToggleDiagOff<CR>')

-- Tree toggle
vim.keymap.set('n', '<C-s>', function() require('nvim-tree.api').tree.toggle() end)

-- Close buffer
vim.keymap.set('n', '<C-q>', ':bd<CR>')

-- Buffer navigation
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', '<S-Right>', ':bnext<CR>')
vim.keymap.set('n', '<S-h>', ':bprev<CR>')
vim.keymap.set('n', '<S-Left>', ':bprev<CR>')
-- Pane navigation 
vim.keymap.set('n', '<C-k>', '<C-w><Up>')
vim.keymap.set('n', '<C-j>', '<C-w><Down>')
vim.keymap.set('n', '<C-h>', '<C-w><Left>')
vim.keymap.set('n', '<C-l>', '<C-w><Right>')
-- Same for arrows
vim.keymap.set('n', '<C-Up>', '<C-w><Up>')
vim.keymap.set('n', '<C-Down>', '<C-w><Down>')
vim.keymap.set('n', '<C-Left>', '<C-w><Left>')
vim.keymap.set('n', '<C-Right>', '<C-w><Right>')

-- In-buffer navigation
vim.keymap.set('n', '<S-k>', '{')
vim.keymap.set('n', '<S-j>', '}')

-- Telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader><space>', function()
  -- Can pass additional configuration to telescope to change theme, layout, etc.
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


require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<C-d>"] = require("telescope.actions").close
      },
    },
  }
}
