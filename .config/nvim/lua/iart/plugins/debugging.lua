return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'

    local dapui = require 'dapui'

    local keymap = vim.keymap

    local widgets = require 'dap.ui.widgets'

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
    keymap.set('n', '<Leader>d<CR>', dap.continue, { desc = 'Continue' })
    keymap.set('n', '<Leader>do', dap.step_over, { desc = 'Step over' })
    keymap.set('n', '<Leader>di', dap.step_into, { desc = 'Step into' })
    keymap.set('n', '<Leader>dO', dap.step_out, { desc = 'Step out' })
    keymap.set('n', '<Leader>dr', dap.repl.open, { desc = 'Open REPL' })
    keymap.set('n', '<Leader>dl', dap.run_last, { desc = 'Run last' })
    keymap.set('n', '<Leader>dw', dapui.eval, { desc = 'Evaluate expression' })
    keymap.set('n', '<Leader>dx', function()
      dap.disconnect()
      dapui.close()
    end, { desc = 'Close DAP UI and stop debugging' }) -- Close dapui and stop debgging

    keymap.set({ 'n', 'v' }, '<Leader>dh', widgets.hover, { desc = 'Show hover' })
    keymap.set({ 'n', 'v' }, '<Leader>dp', widgets.preview, { desc = 'Show preview' })
    keymap.set('n', '<Leader>df', function()
      widgets.centered_float(widgets.frames)
    end, { desc = 'Show frames' })
  end,
}
