return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    -- import mason
    local mason = require 'mason'

    -- import mason-nvim-dap
    local mason_nvim_dap = require 'mason-nvim-dap'

    -- import mason-lspconfig
    local mason_lspconfig = require 'mason-lspconfig'

    local mason_tool_installer = require 'mason-tool-installer'

    -- import dapui
    local dapui = require 'dapui'

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_nvim_dap.setup {
      ensure_installed = {
        'javascript',
        'typescript',
        'php',
      },
      handlers = {
        before = {
          attach = {
            function()
              dapui.open()
            end,
          },
          launch = {
            function()
              dapui.open()
            end,
          },
          event_terminated = {
            function()
              dapui.close()
            end,
          },
          event_exited = {
            function()
              dapui.close()
            end,
          },
        },
      },
    }

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        'ts_ls',
        'html',
        'cssls',
        'tailwindcss',
        'lua_ls',
        'graphql',
        'emmet_ls',
        'prismals',
        'pyright',
        'phpactor',
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'eslint_d', -- js linter
      },
    }
  end,
}
