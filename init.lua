require('config.options')
require('config.variables')
require('config.keymaps')
require('config.autocmd')
require('config.lazy')

local function main()
    vim.cmd.colorscheme('tokyonight')
end

main()

