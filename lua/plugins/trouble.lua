return {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
        { '<leader>ee', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics' },
        { '<leader>eE', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Diagnostics for buffer' },
    },
}
