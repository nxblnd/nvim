return {
    'Wansmer/langmapper.nvim',
    lazy = false,
    priority = 1,
    config = function()
        local langmapper = require('langmapper')
        langmapper.setup({})
        langmapper.hack_get_keymap()

        -- Use autocmd to avoid modifying `init.lua` and keep all langmapper setup at one place.
        vim.api.nvim_create_autocmd('User', {
            pattern = 'LazyDone',
            once = true,
            callback = function()
                langmapper.automapping({ global = true, buffer = false })
            end,
        })
    end,
}
