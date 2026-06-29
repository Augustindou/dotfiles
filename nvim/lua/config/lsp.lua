vim.lsp.enable({
    'lua_ls',
    'kotlin_lsp',
    'tsgo',
    'basedpyright',
    'rust_analyzer',
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

        -- go to definition
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = event.buf })
    end,
})

-- close floating windows (e.g. LSP hover from K) with escape, even while the
-- cursor is still in the source buffer, so "K then <Esc>" dismisses the popup
vim.keymap.set('n', '<Esc>', function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= '' then
            pcall(vim.api.nvim_win_close, win, false)
        end
    end
end)

vim.diagnostic.config({
    -- virtual_lines = {
    --     current_line = true,
    -- },
    virtual_text = true,
})

-- send diagnostics to the quickfix list
vim.keymap.set('n', '<leader>qe', function()
    vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Quickfix: errors only' })

vim.keymap.set('n', '<leader>qw', function()
    vim.diagnostic.setqflist()
end, { desc = 'Quickfix: all diagnostics' })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args) end,
})
