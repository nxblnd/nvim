return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        opts = {
            theme = 'hyper',
            hide = {
                statusline = true,
                tabline = true,
                winbar = true,
            }
        },
        dependencies = {
            { 'nvim-tree/nvim-web-devicons' },
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        opts = {},
        dependencies = {
            { 'nvim-tree/nvim-web-devicons' },
        },
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            { 'nvim-tree/nvim-web-devicons' },
        },
        opts = {},
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.opt.timeout = true
            vim.opt.timeoutlen = 300
        end,
        opts = {},
    },
}
