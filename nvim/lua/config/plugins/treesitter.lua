return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    config = function()
        local ts = require('nvim-treesitter')

        ts.setup({})

        local ensure_installed = {
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
        }

        -- install any parsers from the list that aren't present yet
        -- (the main branch has no `ensure_installed` option)
        local installed = ts.get_installed('parsers')
        local missing = vim.tbl_filter(function(lang)
            return not vim.tbl_contains(installed, lang)
        end, ensure_installed)
        if #missing > 0 then
            ts.install(missing)
        end

        -- the main branch dropped the `highlight`/`indent` setup options;
        -- highlighting and indentation are now enabled per-buffer.
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
                local buf = args.buf

                -- replaces the old highlight.disable for big files
                if vim.api.nvim_buf_line_count(buf) > 50000 then
                    return
                end

                local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
                if not lang then
                    return
                end

                local function start()
                    vim.treesitter.start(buf, lang)
                    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end

                if vim.treesitter.language.add(lang) then
                    start()
                elseif vim.tbl_contains(ts.get_available(), lang) then
                    -- replaces the old `auto_install`: fetch on demand, then start
                    ts.install(lang):await(function(err)
                        if not err and vim.api.nvim_buf_is_valid(buf) then
                            vim.schedule(start)
                        end
                    end)
                end
            end,
        })
    end,
}
