require('config.options')
require('config.variables')
require('config.keymaps')
require('config.autocmd')

local lazypath = vim.fn.stdpath('data') .. 'lazy/lazy.nvim'

local function check_lazy_install()
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable',
            lazypath,
        })
    end
end

local function main()
    check_lazy_install()

    vim.opt.rtp:prepend(lazypath)

    require('lazy').setup('plugins')

    vim.cmd.colorscheme('tokyonight')
end

main()

