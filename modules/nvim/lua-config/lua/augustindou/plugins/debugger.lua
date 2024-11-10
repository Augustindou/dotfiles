return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
        -- Main dap config: add keymaps --
        local dap = require('dap')

        vim.keymap.set('n', '<F5>', function() dap.continue() end)
        vim.keymap.set('n', '<F10>', function() dap.step_over() end)
        vim.keymap.set('n', '<F11>', function() dap.step_into() end)
        vim.keymap.set('n', '<F12>', function() dap.step_out() end)
        vim.keymap.set({'n', 'v'}, '<leader>b', function() dap.toggle_breakpoint() end)
        vim.keymap.set('n', '<leader>dq', function() dap.terminate() end)

        -- DapUI config: open & close depending on dap --
        local dapui = require('dapui')

        vim.keymap.set('n', '<leader>dt', function() dapui.toggle() end)
        vim.keymap.set({'n', 'v'}, '<leader>k', function() dapui.eval() end)


        dap.listeners.before.attach.dapui_config = dapui.open
        dap.listeners.before.launch.dapui_config = dapui.open
        dap.listeners.before.event_terminated.dapui_config = dapui.close
        -- dap.listeners.before.event_exited.dapui_config = dapui.close

        dapui.setup({
            layouts = {
                controls = {
                    element = 'console',
                    enabled = true,
                },
                {
                    elements = {
                        { id = 'scopes',      size = 0.2 },
                        { id = 'breakpoints', size = 0.2 },
                        { id = 'stacks',      size = 0.2 },
                        { id = 'watches',     size = 0.4 },
                    },
                    position = 'left',
                    size = 40,
                },
                {
                    elements = {
                        { id = 'repl',    size = 0.5 },
                        { id = 'console', size = 0.5 },
                    },
                    position = 'bottom',
                    size = 10,
                },
                expand_lines = false,
            },
            floating = {
                border = 'rounded',
            },
        })

        -- Mason-dap config: add used debuggers on startup --
        local mason = require('mason')
        mason.setup()

        local mason_dap = require('mason-nvim-dap')
        mason_dap.setup({
            ensure_installed = {
                'python',
                'js',
                'coreclr',
                'chrome',
                'firefox',
            },
            handlers = {},
        })
    end
}
