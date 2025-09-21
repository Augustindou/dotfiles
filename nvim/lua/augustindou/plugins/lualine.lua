return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                component_separators = '',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diagnostics' },
                lualine_c = {
                    { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
                    { 'filename', path = 4, padding = { left = 0, right = 1 } },
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
