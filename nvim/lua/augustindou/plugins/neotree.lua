return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    config = function()
        vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle position=right<CR>')

        local function expand_or_enter(state)
            local renderer = require('neo-tree.ui.renderer')
            local fs_scan = require('neo-tree.sources.filesystem.lib.fs_scan')
            local node = state.tree:get_node()

            if node:is_expanded() and node:has_children() then
                local child_ids = node:get_child_ids()
                renderer.focus_node(state, child_ids[1])
            elseif not node:is_expanded() and node.type == 'directory' then
                if not node.loaded then
                    local id = node:get_id()
                    state.explicitly_opened_directories = state.explicitly_opened_directories or {}
                    state.explicitly_opened_directories[id] = true
                    renderer.position.set(state, nil)
                    fs_scan.get_items(state, id, nil, nil, false, false)
                end
                node:expand()
            end

            renderer.redraw(state)
        end

        local function collapse_or_move_up(state)
            local renderer = require('neo-tree.ui.renderer')
            local node = state.tree:get_node()
            if node:is_expanded() then
                node:collapse()
            else
                renderer.focus_node(state, node:get_parent_id())
            end
            renderer.redraw(state)
        end

        require('neo-tree').setup({
            default_component_configs = {
                icon = {
                    folder_closed = '',
                    folder_open = '',
                    folder_empty = '󰜌',
                },
            },
            window = {
                mappings = {
                    ['l'] = expand_or_enter,
                    ['h'] = collapse_or_move_up,
                    ['<right>'] = expand_or_enter,
                    ['<left>'] = collapse_or_move_up,
                    ['<enter>'] = 'open',
                    ['<esc>'] = 'cancel',
                    ['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
                    ['o'] = { 'add', config = { show_path = 'none' } },
                    ['d'] = 'delete',
                    ['r'] = 'rename',
                    ['y'] = 'copy_to_clipboard',
                    ['x'] = 'cut_to_clipboard',
                    ['p'] = 'paste_from_clipboard',
                    ['?'] = 'show_help',
                    ['i'] = 'show_file_details',

                    ['<leader>gA'] = 'git_add_all',
                    ['<leader>gu'] = 'git_unstage_file',
                    ['<leader>ga'] = 'git_add_file',
                },
            },
            filesystem = {
                follow_current_file = { enabled = true },
                filtered_items = { visible = true },
                hijack_netrw_behavior = 'open_current',
            },
            event_handlers = {
                {
                    event = 'file_open_requested',
                    handler = function()
                        require('neo-tree.command').execute({ action = 'close' })
                    end,
                },
            },
        })
    end,
}
