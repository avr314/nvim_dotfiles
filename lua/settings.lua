vim.o.swapfile        = false
vim.o.relativenumber  = true -- Relative number line
vim.o.hlsearch        = true -- Set highlight on search
vim.o.breakindent     = true
vim.o.undofile        = true
vim.o.ignorecase      = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase       = true
vim.o.termguicolors   = true
vim.o.expandtab       = true
vim.o.cursorline      = true
-- vim.o.cursorcolumn = true
--
vim.o.mouse       = 'a'                 -- Enable mouse mode
vim.o.clipboard   = 'unnamedplus'       -- Sync clipboard between env and nvim
vim.o.completeopt = 'menuone,noselect'  -- Set completeopt to have a better completion experience

vim.o.updatetime  = 250
vim.o.timeoutlen  = 300
vim.o.tabstop     = 2
vim.o.shiftwidth  = 2 -- '>>' operator <num> spaces

vim.wo.number       = true   -- Make line numbers default
vim.wo.signcolumn   = 'yes'  -- Keep signcolumn on by default

vim.opt.foldenable  = false
vim.opt.list        = true
vim.opt.listchars   = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand  = 'split'
vim.opt.scrolloff   = 10

vim.cmd([[ 
  :highlight CursorColumn guibg=#3e4452
  :highlight CursorLine guibg=#3e4452
]])


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Folded functions
vim.cmd([[ 
  :highlight Folded guifg=#3e4452
]])

-- See if this does the trick for clipboard (might need to change to "unnamedplus")
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("help_window_right", {}),
  pattern = {"*.txt"},
  callback = function()
    if vim.o.filetype == 'help' then vim.cmd.wincmd('L') end
  end
})

-- C-specific syntax highlight settings (nested ifdefs, etc.)
vim.api.nvim_set_hl(0, '@lsp.type.comment.c', {})
vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})
