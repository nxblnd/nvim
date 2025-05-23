local keymap = require('helpers.keymap').keymap

-- Quick nvim config updates
keymap('<leader><leader>x', '<cmd>source %<cr>', 'Source current file')
keymap('<space>x', ':.lua<cr>', 'Run current line as lua script')
keymap('<space>x', ':lua<cr>', 'Run currect selection as lua script', { mode = 'v' })

-- Better 'o' and 'O'
keymap('<Leader>o', 'o<Esc>o', 'Add 2 lines below and go into Insert mode')
keymap('<Leader>O', 'O<Esc>O', 'Add 2 lines above and go into Insert mode')

-- Buffer navigation keymaps
keymap('<Leader>h', ':bnext<cr>', 'Go to next buffer')
keymap('<Leader>l', ':bprevious<cr>', 'Go to previous buffer')

-- Split navigation keymaps
keymap('<C-h>', '<C-w><C-h>', 'Move to left split')
keymap('<C-j>', '<C-w><C-j>', 'Move to lower split')
keymap('<C-k>', '<C-w><C-k>', 'Move to upper split')
keymap('<C-l>', '<C-w><C-l>', 'Move to right split')

-- Misc keymaps
keymap('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode', { mode = 't' })
keymap('<leader>m', ':Oil<cr>', 'Open file manager')
