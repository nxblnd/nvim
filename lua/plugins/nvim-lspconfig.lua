local servers = {
    ['ansible-lint'] = {}, -- Ansible linter
    ansiblels = {}, -- Ansible
    angularls = {}, -- AngularJS
    awk_ls = {}, -- AWK
    bashls = {}, -- Bash
    clangd = {}, -- C/C++
    ['cmake-language-server'] = {}, -- CMake
    cssls = {}, -- CSS
    docker_compose_language_service = {}, -- Docker compose
    dockerls = {}, -- Dockerfile
    eslint = {}, -- Eslint
    gopls = {}, -- Go
    html = {}, -- HTML
    java_language_server = {}, -- Java
    jqls = {}, -- JQ
    jsonls = {}, -- JSON
    -- kulala_ls = {}, -- Kulala 
    ['kulala-fmt'] = {}, -- Kulala
    lemminx = {}, -- XML
    lua_ls = {}, -- Lua
    marksman = {}, -- Markdown
    ['nginx-language-server'] = {}, -- nginx
    pylsp = {}, -- Python
    ruff = {}, -- Python linter
    sqlls = {}, -- SQL
    systemdlint = {}, -- SystemD unit linter
    texlab = {}, -- LaTeX
    ts_ls = {}, -- JavaScript/TypeScript
    vue_ls = {}, -- Vue
    yamlls = {}, -- YAML
}

local keymap = require('helpers.keymap').keymap

return {
    'neovim/nvim-lspconfig',
    enabled = true,
    dependencies = {
        {
            'williamboman/mason.nvim',
            build = ':MasonUpdate',
            opts = {
                registries = {
                    "github:mason-org/mason-registry",
                },
            },
        },
        {
            'williamboman/mason-lspconfig.nvim',
        },
        {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        {
            'j-hui/fidget.nvim',
            opts = {},
        },
    },
    config = function()
        local function create_keymaps(event_buffer)
            local buffered_keymap = function(kmap, func, desc, mode)
                keymap(kmap, func, desc, { mode = mode or 'n', buffer = event_buffer })
            end

            local t_builtin = require('telescope.builtin')

            buffered_keymap('gd', t_builtin.lsp_definitions, 'Goto definition')
            buffered_keymap('gD', vim.lsp.buf.declaration, 'Goto declaration')
            buffered_keymap('gr', t_builtin.lsp_references, 'Goto references')
            buffered_keymap('gI', t_builtin.lsp_implementations, 'Goto implementation')
            buffered_keymap('g<Leader>t', t_builtin.lsp_type_definitions, 'Goto type definition')
            buffered_keymap('<Leader>sc', t_builtin.lsp_document_symbols, 'Search symbols in document')
            buffered_keymap('<Leader>sC', t_builtin.lsp_workspace_symbols, 'Search symbols in workspace')
            buffered_keymap('<Leader>cn', vim.lsp.buf.rename, 'Rename under cursor with LSP')
            buffered_keymap('<Leader>a', vim.lsp.buf.code_action, 'Code action', { mode = { 'n', 'x' } })
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
                    keymap('<Leader>th', function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                    end, 'Toggle inlay hints')
                end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        require('mason').setup()
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {})
        require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            }
        })
    end
}
