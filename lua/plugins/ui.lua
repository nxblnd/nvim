local function load_header()
    local file = io.open(vim.fn.stdpath('config') .. '/header_banner.ascii', 'r')
    local header_table = {}
    if file == nil then
        print('Header banner is empty')
        return header_table
    end
    for line in file:lines() do
        table.insert(header_table, line)
    end
    file:close()
    return header_table
end

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
            },
            change_to_vcs_root = true,
            config = {
                shortcut = {
                   { desc = 'Update', action = 'Lazy update', key = 'u', group = 'DashboardShortCut' },
                   { desc = 'New file', action = 'enew', key = 'n', group = 'DashboardShortCut' },
                   { desc = 'Open nvim config', action = 'Oil' .. vim.fn.stdpath('config'), key = 'c', group = 'DashboardShortCut' },
                },
                header = load_header(),
                footer = {},
            },
        },
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        opts = {},
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        },
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
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
