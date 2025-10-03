return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    lazy = false,
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'c',
                'lua',
                'vim',
                'vimdoc',
                'query',
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
                disable = function(_, bufnr) --
                    return vim.api.nvim_buf_line_count(bufnr) > 50000
                end,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
