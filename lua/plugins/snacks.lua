local dashboard = {
    preset = {
        header = table.concat(vim.fn.readfile(vim.fn.stdpath('config') .. '/header_banner.ascii', 'r'), '\n')
    },
    sections = {
        {
            section = 'header',
        },
        {
            section = 'startup',
        },
        {
            pane = 2,
            section = 'keys',
            title = 'Keymaps',
            icon = ' ',
            indent = 2,
            padding = 1,
        },
        {
            pane = 2,
            section = 'recent_files',
            title = 'Recent files',
            icon = ' ',
            indent = 2,
            padding = 1,
        },
        {
            pane = 2,
            section = 'projects',
            title = 'Projects',
            icon = ' ',
            indent = 2,
            padding = 1,
        },
        {
            enabled = function ()
                return Snacks.git.get_root() ~= nil
            end,
            pane = 2,
            section = 'terminal',
            title = 'Git status',
            icon = ' ',
            cmd = 'git diff --shortstat',
        },
    },
}

return {
    'folke/snacks.nvim',
    priority = 1000,
    opts = {
        dashboard = dashboard,
    },
}
