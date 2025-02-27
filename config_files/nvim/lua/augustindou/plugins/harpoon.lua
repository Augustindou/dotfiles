return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
        local harpoon = require('harpoon')
        local conf = require('telescope.config').values
        harpoon:setup({})

        local toggle_opts = {
            title = ' Harpoon ',
            border = 'rounded',
            title_pos = 'center',
        }

        -- basic telescope configuration
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require('telescope.pickers')
                .new({}, {
                    prompt_title = 'Harpoon',
                    finder = require('telescope.finders').new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                })
                :find()
        end

        vim.keymap.set('n', '<C-h>', function()
            toggle_telescope(harpoon:list())
        end, { desc = 'Open harpoon window' })

        vim.keymap.set('n', '<leader>a', function()
            harpoon:list():add()
        end)
        vim.keymap.set('n', '<leader>h', function()
            harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
        end)

        vim.keymap.set('n', '<leader>&', function()
            harpoon:list():select(1)
        end)
        vim.keymap.set('n', '<leader>é', function()
            harpoon:list():select(2)
        end)
        vim.keymap.set('n', '<leader>"', function()
            harpoon:list():select(3)
        end)
        vim.keymap.set('n', "<leader>'", function()
            harpoon:list():select(4)
        end)
    end,
}
