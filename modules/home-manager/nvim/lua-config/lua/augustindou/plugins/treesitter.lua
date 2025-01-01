return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        local treesitter = require('nvim-treesitter.configs')

        treesitter.setup({
            ensure_installed = {
                'c',
                'lua',
                'vim',
                'vimdoc',
                'query',
                'elixir',
                'heex',
                'javascript',
                'typescript',
                'rust',
                'html',
                'markdown',
                'markdown_inline',
                'angular',
                'python',
            },
            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                disable = function(lang, bufnr) --
                    -- Extend this to other languages by adding `lang == "x"` where x is the language
                    return vim.api.nvim_buf_line_count(bufnr) > 50000
                end,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
