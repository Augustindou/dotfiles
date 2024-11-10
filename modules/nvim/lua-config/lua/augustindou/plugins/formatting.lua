return {
    'zapling/mason-conform.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'stevearc/conform.nvim',
    },
    config = function()
        local conform = require('conform')
        conform.setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'black' },
                rust = { 'rustfmt' },
                javascript = { 'prettier' },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
        })

        vim.keymap.set('n', '<leader>f', conform.format)
    end,
}
