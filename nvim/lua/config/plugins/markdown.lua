return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'markdown' },
    config = function(_, opts)
        require('render-markdown').setup(opts)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'markdown',
            callback = function()
                vim.opt_local.wrap = true
                vim.opt_local.linebreak = true
            end,
        })
    end,
    opts = {
        -- render headings with icons and padding
        heading = {
            icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        },
        -- render checkboxes
        checkbox = {
            unchecked = { icon = '󰄱 ' },
            checked = { icon = '󰱒 ' },
        },
        -- render bullets
        bullet = {
            icons = { '●', '○', '◆', '◇' },
        },
        -- render code blocks with a background
        code = {
            style = 'full',
        },
    },
}
