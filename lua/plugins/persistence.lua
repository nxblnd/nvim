return {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
    keys = {
        { '<Leader>qr', function() require('persistence').load() end, desc = 'Restore session' },
        { '<Leader>qs', function() require('persistence').select() end, desc = 'Select session' },
        { '<Leader>ql', function() require('persistence').load({ last = true }) end, desc = 'Restore last session' },
        { '<Leader>qd', function() require('persistence').stop() end, desc = 'Do not save current session' },
    },
}
