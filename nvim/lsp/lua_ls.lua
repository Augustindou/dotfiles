return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- load the Neovim runtime so `vim` and the full API
                -- (vim.api/fn/lsp/...) are recognized with completion + types
                library = {
                    vim.env.VIMRUNTIME,
                    '${3rd}/luv/library',
                },
                checkThirdParty = false,
            },
        },
    },
}
