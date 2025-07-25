local t_builtin = require('telescope.builtin')
local actions = require('telescope.actions')

return {
    'nvim-telescope/telescope.nvim',
    opts = {
        defaults = {
            mappings = {
                i = {
                    ['<esc>'] = actions.close, -- esc to quit telescope, skipping normal mode
                    ['<tab>'] = actions.move_selection_next,
                    ['<s-tab>'] = actions.move_selection_previous,
                },
            },
            sorting_strategy = 'ascending',
        },
    },
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    keys = {
        { '<Leader>sh', t_builtin.help_tags, desc = 'Search help' },
        { '<Leader>sf', t_builtin.find_files, desc = 'Search files' },
        { '<Leader>sg', t_builtin.live_grep, desc = 'Search by grep' },
        { '<Leader>sw', t_builtin.grep_string, desc = 'Search word under cursor' },
        { '<Leader>sr', t_builtin.resume, desc = 'Search resume' },
        { '<Leader>so', t_builtin.oldfiles, desc = 'Search previously open files' },
        { '<Leader><Leader>', t_builtin.buffers, desc = 'Search open buffers' },
    },
}
