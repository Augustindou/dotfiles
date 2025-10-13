return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    lazy = false,
    config = function()
        require('oil').setup({
            delete_to_trash = true,
            keymaps = {
                ['<C-p>'] = false,
            },
            view_options = {
                show_hidden = true,
            },
        })

        vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
}
