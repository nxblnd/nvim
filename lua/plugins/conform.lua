return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        { '<Leader>f', function() require('conform').format({ async = true }) end, desc = 'Format buffer' },
    },
    opts = {
        formatters_by_ft = {},
        default_format_opts = {
            lsp_format = 'fallback'
        },
    }
}
