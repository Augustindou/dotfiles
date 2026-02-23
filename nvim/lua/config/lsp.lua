vim.lsp.enable({
    'lua_ls',
    'kotlin_lsp',
    'tsgo',
    'basedpyright',
})

vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
    root_markers = { '.git' },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client:supports_method('textDocument/completion') then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }

            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })

            -- auto-complete on enter
            vim.keymap.set('i', '<CR>', function()
                if vim.fn.pumvisible() and vim.fn.complete_info().selected ~= -1 then
                    return '<C-y>'
                end
                return '<CR>'
            end, { expr = true })

            -- trigger completion on c-space
            vim.keymap.set('i', '<C-Space>', function()
                vim.lsp.completion.get()
            end)
        end
    end,
})

vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args) end,
})
