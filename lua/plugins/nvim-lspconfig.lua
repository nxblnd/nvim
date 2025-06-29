local servers = require('language').lsp
local keymap = require('helpers.keymap').keymap
local t_builtin = require('telescope.builtin')

return {
    'neovim/nvim-lspconfig',
    enabled = true,
    dependencies = {
        { 'saghen/blink.cmp' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
        {
            'mason-org/mason.nvim',
            build = ":MasonUpdate",
            opts = {},
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

        local capabilities = vim.tbl_deep_extend(
            'force',
            {},
            vim.lsp.protocol.make_client_capabilities(),
            require('blink.cmp').get_lsp_capabilities()
        )

        require('mason-tool-installer').setup({
            ensure_installed = vim.tbl_keys(servers or {}),
        })

        require('mason-lspconfig').setup({
            ensure_installed = {}, -- already installed with mason-tool-installer
            automatic_enable = true,
            automatic_installation = false,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        })
    end
}
