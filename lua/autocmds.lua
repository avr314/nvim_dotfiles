-- Autocommands are a way to execute commands automatically based on events.

vim.api.nvim_set_hl(0, "YankHL", { bg = '#ffffff', fg = '#4f586b', reverse = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'YankHL' })
  end,
})
