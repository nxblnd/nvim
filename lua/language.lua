local M = {}

---@alias TreesitterLanguages string[]
---@alias LSPLanguages table<string, table>:
---@type { [string]: { treesitter?: TreesitterLanguages, lsp?: LSPLanguages} }
M.languages = {
    ansible = {
        lsp = {
            ['ansible-lint'] = {},
            ansiblels = {},
        },
    },
    awk = {
        treesitter = { 'awk' },
        lsp = {
            awk_ls = {},
        },
    },
    bash = {
        treesitter = { 'bash' },
        lsp = {
            bashls = {},
        },
    },
    charts = {
        treesitter = {
            'dot',
            'gnuplot',
        },
    },
    c_cpp = {
        treesitter = {
            'c',
            'cpp',
        },
        lsp = {
            clangd = {},
        },
    },
    c_sharp = {
        treesitter = { 'c_sharp' },
    },
    css = {
        treesitter = {
            'css',
            'scss',
        },
        lsp = {
            cssls = {},
        }
    },
    docker = {
        treesitter = { 'dockerfile' },
        lsp = {
            dockerls = {},
            docker_compose_language_service = {},
        },
    },
    fish = {
        treesitter = { 'fish' },
        lsp = {
            fish_lsp = {},
        },
    },
    git = {
        treesitter = {
            'git_config',
            'git_rebase',
            'gitattributes',
            'gitcommit',
            'gitignore',
        },
    },
    go = {
        treesitter = { 'go' },
        lsp = {
            gopls = {},
        },
    },
    html = {
        treesitter = { 'html' },
        lsp = {
            html = {},
        },
    },
    ini = {
        treesitter = { 'ini' },
    },
    java = {
        treesitter = {
            'java',
            'javadoc',
            'properties',
        },
        lsp = {
            java_language_server = {},
        },
    },
    javascript = {
        treesitter = {
            'javascript',
            'typescript',
            'jsdoc',
            'tsx',
            'astro',
            'angular',
            'vue',
        },
        lsp = {
            eslint = {},
            ts_ls = {},
            angularls = {},
            astro = {},
            vue_ls = {},
        },
    },
    json = {
        treesitter = {
            'json',
            'json5',
            'jq',
        },
        lsp = {
            jqls = {},
        },
    },
    kotlin = {
        treesitter = { 'kotlin' },
    },
    llvm = {
        treesitter = { 'llvm' },
    },
    lua = {
        treesitter = {
            'lua',
            'luadoc',
            'fennel',
        },
        lsp = {
            lua_ls = {},
        },
    },
    lisp = {
        treesitter = {
            'commonlisp',
            'clojure',
            'scheme',
        },
    },
    make = {
        treesitter = {
            'make',
            'cmake',
        },
        lsp = {
            ['cmake-language-server'] = {},
        },
    },
    misc = {
        treesitter = {
            'csv',
            'comment', -- todo, fixme comments
            'desktop', -- .desktop files
            'diff', -- diff files
            'editorconfig', -- .editorconfig files
            'http',
            'regex',
            'ssh_config',
            'tsv',
        },
    },
    markdown = {
        treesitter = {
            'markdown',
            'markdown_inline',
        },
        lsp = {
            marksman = {},
        },
    },
    pascal = {
        treesitter = { 'pascal' },
    },
    perl = {
        treesitter = { 'perl' },
    },
    php = {
        treesitter = { 'php' },
    },
    powershell = {
        treesitter = { 'powershell' },
    },
    python = {
        treesitter = { 'python' },
        lsp = {
            pylsp = {},
            ruff = {},
            ty = {},
        },
    },
    ruby = {
        treesitter = { 'ruby' },
    },
    rust = {
        treesitter = { 'rust' },
    },
    sql = {
        treesitter = { 'sql' },
        lsp = {
            sqlls = {},
        },
    },
    ssh = {
    },
    systemd = {
        lsp = {
            systemd_ls = {},
            systemdlint = {},
        },
    },
    tex = {
        treesitter = {
            'latex',
            'bibtex',
        },
        lsp = {
            texlab = {},
        },
    },
    toml = {
        treesitter = { 'toml' },
    },
    vim = {
        treesitter = {
            'vim',
            'vimdoc',
        },
    },
    xml = {
        treesitter = { 'xml' },
        lsp = {
            lemminx = {},
        },
    },
    yaml = {
        treesitter = { 'yaml' },
        lsp = {
            yamlls = {},
        },
    },
    webserver = {
        treesitter = {
            'nginx',
            'caddy',
        },
        lsp = {
            ['nginx-language-server'] = {},
            ['nginx-config-formatter'] = {},
        },
    },
}

M.treesitter = {}
M.lsp = {}

for _, target in pairs(M.languages) do
    if target.treesitter ~= nil then
        for _, language in pairs(target.treesitter) do
            table.insert(M.treesitter, language)
        end
    end

    if target.lsp ~= nil then
        for name, opts in pairs(target.lsp) do
            M.lsp[name] = opts
        end
    end
end

return M
