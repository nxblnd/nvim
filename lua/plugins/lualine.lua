return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
        {
            'nvim-tree/nvim-web-devicons',
            enabled = vim.g.have_nerd_font,
        },
    },
}
