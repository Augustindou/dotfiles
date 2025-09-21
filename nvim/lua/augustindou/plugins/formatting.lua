return {

    'zapling/mason-conform.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        { 'stevearc/conform.nvim', branch = 'nvim-0.9' },
    },
    config = function()
        -- Check if file exists --
        local function exists(file)
            local ok, err, code = os.rename(file, file)
            if not ok then
                if code == 13 then
                    -- Permission denied, but it exists
                    return true
                end
            end
            return ok, err
        end

        -- Config --
        local conform = require('conform')
        conform.setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'black' },
                rust = { 'rustfmt' },
                javascript = { 'prettierd', 'prettier' },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
        })

        vim.keymap.set('n', '<leader>f', conform.format)
    end,
}
