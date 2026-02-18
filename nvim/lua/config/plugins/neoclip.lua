return {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
        { 'kkharji/sqlite.lua', module = 'sqlite' },
        { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
        require('neoclip').setup({
            enable_persistent_history = true,
            prompt = nil,
            default_register_macros = 'a',
            keys = {
                telescope = {
                    i = {
                        paste = { '<c-p>' },
                        paste_behind = {},
                    },
                    n = {
                        paste = { 'p', '<c-p>' },
                        paste_behind = {},
                    },
                },
            },
        })

        vim.keymap.set('n', '<leader>h', '<CMD>Telescope neoclip<CR>')
    end,
}
