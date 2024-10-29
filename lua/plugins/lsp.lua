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
            {
                'williamboman/mason.nvim',
                build = ':MasonUpdate',
                config = true,
            },
            'williamboman/mason-lspconfig.nvim',
            {
                'j-hui/fidget.nvim',
                opts = {},
            },
        },
        config = function()
            local function create_keymaps(event_buffer)
                local keymap = function(kmap, func, desc, mode)
                    keymap_generic = require('../config/keymaps.lua')
                    keymap_generic(kmap, func, desc, { mode = mode or 'n', buffer = event_buffer })
                end
                t_builtin = require('telescope.builtin')

                keymap('gd', t_builtin.lsp_definitions, 'Goto definition')
                keymap('gD', vim.lsp.buf.declaration, 'Goto declaration')
                keymap('gr', t_builtin.lsp_references, 'Goto references')
                keymap('gI', t_builtin.lsp_implementations, 'Goto implementation')
                keymap('g<Leader>t', t_builtin.lsp_type_definitions, 'Goto type definition')
                keymap('<Leader>sc', t_builtin.lsp_document_symbols, 'Search symbols in document')
                keymap('<Leader>sC', t_builtin.lsp_workspace_symbols, 'Search symbols in workspace')
                keymap('<Leader>cn', vim.lsp.buf.rename, 'Rename under cursor with LSP')
                keymap('<Leader>a', vim.lsp.buf.code_action, 'Code action', { mode = { 'n', 'x' } })
            end

            local function hide_highlight(event_buffer)
                local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

                vim.api.nvim_create_autocmd(
                    { 'CursorHold', 'CursorHoldI' },
                    {
                        buffer = event_buffer,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                vim.api.nvim_create_autocmd(
                    { 'CursorMoved', 'CursorMovedI' },
                    {
                        buffer = event_buffer,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                vim.api.nvim_create_autocmd( 'LspDetach', {
                    group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                    callback = function(event)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event.buf }
                    end
                })
            end



            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                callback = function(event)
                    create_keymaps(event.buf)

                    local client = vim.lsp.get_client_by_id(event.data.client_id)

                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        hide_highlight(event.buf)
                    end

                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        require('../config/keymaps.lua')('<Leader>th', function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                        end, 'Toggle inlay hints')
                    end
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
        end
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

