return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = { 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/nvim-cmp', 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
    config = function()
        vim.opt.signcolumn = 'yes'

        local lspconfig_defaults = require('lspconfig').util.default_config
        local cmp_default_capabilities = require('cmp_nvim_lsp').default_capabilities()
        lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities,
            cmp_default_capabilities)

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = {
                    buffer = event.buf
                }

                vim.keymap.set('n', 'K', function()
                    vim.lsp.buf.hover()
                end, opts)
                vim.keymap.set('n', 'gd', function()
                    vim.lsp.buf.definition()
                end, opts)
                vim.keymap.set('n', 'gD', function()
                    vim.lsp.buf.declaration()
                end, opts)
                vim.keymap.set('n', 'gi', function()
                    vim.lsp.buf.implementation()
                end, opts)
                vim.keymap.set('n', 'go', function()
                    vim.lsp.buf.type_definition()
                end, opts)
                vim.keymap.set('n', 'gr', function()
                    vim.lsp.buf.references()
                end, opts)
                vim.keymap.set('n', 'gs', function()
                    vim.lsp.buf.signature_help()
                end, opts)
                vim.keymap.set('i', '<C-h>', function()
                    vim.lsp.buf.signature_help()
                end, opts)
                vim.keymap.set('n', '<F2>', function()
                    vim.lsp.buf.rename()
                end, opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', function()
                    vim.lsp.buf.format({
                        async = true
                    })
                end, opts)
                vim.keymap.set('n', '<F4>', function()
                    vim.lsp.buf.code_action()
                end, opts)
            end
        })

        local lsp_zero = require('lsp-zero')

        lsp_zero.omnifunc.setup({
            tabcomplete = true,
            use_fallback = true,
            update_on_delete = true,
            autocomplete = true,
            trigger = '<C-Space>'
        })

        local mason = require("mason")
        mason.setup()

        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                'lua_ls', 'rust_analyzer', 'pylsp', 'eslint',
                'ts_ls', 'angularls'
            },
        })

        local lsp_config = require('lspconfig')
        lsp_config.lua_ls.setup({
            settings = { Lua = { diagnostics = { globals = { 'vim' }, }, }, },
        })
        lsp_config.rust_analyzer.setup({})
        lsp_config.pylsp.setup({})
        lsp_config.eslint.setup({})
        lsp_config.ts_ls.setup({})
        lsp_config.angularls.setup({})
    end
}
