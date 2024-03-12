vim.o.swapfile = false
-- Relative number line
vim.o.relativenumber = true
-- Set highlight on search
vim.o.hlsearch = false
-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
vim.o.mouse = 'a'
-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

-- Use spaces instead of tabs
vim.o.expandtab = true
-- Tab = <num> spaces
vim.o.tabstop = 2
-- '>>' operator <num> spaces
vim.o.shiftwidth = 2

-- vim.o.cursorcolumn = true
vim.o.cursorline = true

vim.cmd([[ 
  :highlight CursorColumn guibg=#3e4452
  :highlight CursorLine guibg=#3e4452
]])

-- Treesitter-based fold (TODO: add LSP-based (kevinhwang91/nvim-ufo))

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Folded functions
vim.cmd([[ 
  :highlight Folded guifg=#3e4452
]])

vim.opt.foldenable = false

-- See if this does the trick for clipboard (might need to change to "unnamedplus")
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("help_window_right", {}),
  pattern = {"*.txt"},
  callback = function()
    if vim.o.filetype == 'help' then vim.cmd.wincmd('L') end
  end
})

vim.api.nvim_set_hl(0, '@lsp.type.comment.c', {})
vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})

vim.g.copilot_enabled = 0
