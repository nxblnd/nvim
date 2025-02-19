local M = {}

function M.keymap(lhs, rhs, desc, opts)
    local mode = (opts and opts.mode) or 'n'
    local buffer = (opts and opts.buffer) or false
    vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = buffer })
end

return M
