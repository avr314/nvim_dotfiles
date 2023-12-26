local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure Plugins
require('lazy').setup({

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Sensible defautls ?
  'tpope/vim-sensible',
  'tpope/vim-repeat',
  'tpope/vim-surround',

  {
    'williamboman/mason.nvim',
    config = function ()
      require('mason').setup()
    end
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function ()
      require('mason-tool-installer').setup {
        ensure_installed = {
          'verible',
          'clangd',
          'rust_analyzer',
        },
      }
    end
  },

  -- Toggle LSP diag messages
  {
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    config = function ()
      require('toggle_lsp_diagnostics').init()
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
      'folke/neodev.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    },
  },

  -- Autocomp
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets',
    },
  },

  -- Sidebar Tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    version = 'nightly',
    config = function ()
      require('nvim-tree').setup()
    end
  },

  -- Colorscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function ()
      require('catppuccin').setup({
        flavour = 'mocha',
        transparent_background = true,
        color_overrides = {},
      })
      vim.cmd.colorscheme 'catppuccin'
    end
  },

  {
    'delafthi/nord-nvim',
    name = 'nord-nvim',
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    'github/copilot.vim'
  },

  -- Auto parens
  {
    'jiangmiao/auto-pairs',
  },

  -- Line indent vert lines
  {
    'Yggdroot/indentLine',
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
      require('toggleterm').setup({
        open_mapping = [[<C-\>]],
        shell = 'fish',
        direction = 'float',
        highlights = {
          NormalFloat = {
            guibg = 0x2a303e,
          },
        },
        float_opts ={
          border = 'curved',
        },
      })
    end
  },

  -- Bufferline as tabline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "none",
          mode = "buffers",
          style_preset = require('bufferline').style_preset.no_italic,
          buffer_close_icon = '',
          separator_style = {'', ''},
          indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon',
          },
          offsets = {
            {
              filetype = "NvimTree",
              highlight = "Directory",
              text_align = "center",
              separator = true,
            }
          },
          color_icons = true,
        },
      })
    end
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- Scala setup
  -- scala does its own thing for some reason
  --{
  --  'scalameta/nvim-metals',
  --  dependencies = { "nvim-lua/plenary.nvim" }
  --},

}, {})

------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Config
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- [[ Enable fzf native, if installed ]]
pcall(require('telescope').load_extension, 'fzf')



-- [[ Telescope config ]]
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- [[ Treesitter settings ]]
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'vim' },
  sync_install = true,
  -- auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}

----------------- [[ BEGIN nvim-cmp Config ]]
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function (args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete(),
    --['<C-e>'] = cmp.mapping.abort(),

    -- Integrate cmp with copilot
    ['<C-j>'] = cmp.mapping(function (fallback)
      cmp.mapping.abort()
      local copilot_keys = vim.fn["copilot#Accept"]()
      if copilot_keys ~= "" then
        vim.api.nvim_feedkeys(copilot_keys, 'i', true)
      else
        fallback()
      end
    end),
    ------------------------------

    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
}
-- Set config for specific filetype
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({

  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
----------------- [[ END nvim-cmp Config ]]

----------------- [[ BEGIN LSP Config ]]
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
----------------- [[ END LSP Config ]]

---- Lang server list
local servers = {
  clangd = {},
  verible = {},
  rust_analyzer = {},
  -- pyright = {},
  -- gopls = {},
}

local on_attach = function (_, bufnr)
  local nmap = function (keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('D', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('S', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gI', vim.lsp.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function (_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

---- Ensure servers in list installed -- Check if mason-tool-installer duplicates this!
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,

  -- Verible suppress warnings conf file for EDA server

  ['verible'] = function ()
    require('lspconfig')['verible'].setup {
      --cmd = { '/home/ff/eecs151/tools-151/verible/bin/verible-verilog-ls', '--rules_config', 'home/ff/eecs151/tools-151/verible/rules'}
      cmd = { '/home/ke314/.local/share/nvim/mason/packages/verible/verible-v0.0-3385-gedfca850/bin/verible-verilog-ls',
              '--rules_config',
              '/home/ke314/.local/share/nvim/mason/packages/verible/verible-v0.0-3385-gedfca850/bin/rules'}
    }
  end,

  ['lua_ls'] = function ()
    require('lspconfig')['lua_ls'].setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  end
}



-- modeline
-- vim: ts=2 sts=2 sw=2 et
