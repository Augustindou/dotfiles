return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    config = function()
        local actions = require('telescope.actions')
        local telescope = require('telescope')

        telescope.setup({
            defaults = {
                file_ignore_patterns = { 'node_modules/' },
                path_display = { 'smart' },
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                    },
                },
            },
        })

        telescope.load_extension('fzf')

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })

        vim.keymap.set('n', '<C-p>', function()
            builtin.find_files({ no_ignore = true })
        end, { desc = 'Telescope files' })
    end,
}
