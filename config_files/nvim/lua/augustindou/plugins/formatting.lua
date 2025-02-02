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
                nix = { 'nixpkgs-fmt' },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
        })

        -- Don't download formatters if on nixos
        if not exists('/etc/nixos/') then
            local mason_conform = require('mason-conform')
            mason_conform.setup({})
        end

        vim.keymap.set('n', '<leader>f', conform.format)
    end,
}
