local servers = {
    awk_ls = {}, -- AWK
    ansiblels = {}, -- Ansible
    bashls = {}, -- Bash
    clangd = {}, -- C/C++
    cmake = {}, -- CMake
    cssls = {}, -- CSS
    dockerls = {}, -- Dockerfile
    docker_compose_language_service = {}, -- Docker compose
    eslint = {}, -- Eslint
    gopls = {}, -- Go
    html = {}, -- HTML
    jsonls = {}, -- JSON
    java_language_server = {}, -- Java
    tsserver = {}, -- JavaScript/TypeScript
    jqls = {}, -- JQ
    texlab = {}, -- LaTeX
    lua_ls = {}, -- Lua
    pylsp = {}, -- Python
    sqlls = {}, -- SQL
    volar = {}, -- Vue
    limminx = {}, -- XML
    yamlls = {}, -- YAML
}

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
    },
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        opts = {},
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
        },
        opts = {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            },
        },
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'rafamadriz/friendly-snippets',
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
            end,
        },
    },
}

