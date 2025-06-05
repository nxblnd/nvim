local keymap = require('helpers.keymap').keymap

-- Quick nvim config updates
keymap('<leader><leader>x', '<cmd>source %<cr>', 'Source current file')
keymap('<space>x', ':.lua<cr>', 'Run current line as lua script')
keymap('<space>x', ':lua<cr>', 'Run currect selection as lua script', { mode = 'v' })

-- Better 'o' and 'O'
keymap('<leader>o', 'o<Esc>o', 'Add 2 lines below and go into Insert mode')
keymap('<leader>O', 'O<Esc>O', 'Add 2 lines above and go into Insert mode')

-- Buffer navigation keymaps
keymap('<leader>h', ':bnext<cr>', 'Go to next buffer')
keymap('<leader>l', ':bprevious<cr>', 'Go to previous buffer')

-- Split navigation keymaps
keymap('<c-h>', '<c-w><c-h>', 'Move to left split')
keymap('<c-j>', '<c-w><c-j>', 'Move to lower split')
keymap('<c-k>', '<c-w><c-k>', 'Move to upper split')
keymap('<c-l>', '<c-w><c-l>', 'Move to right split')

-- Split resize keymaps
-- keymap('<c-H>', '<c-W><', 'Decrease split columns')
-- keymap('<c-J>', '<c-W>-', 'Decrease split rows')
-- keymap('<c-K>', '<c-W>+', 'Increase split rows')
-- keymap('<c-L>', '<c-W>>', 'Increase split columns')

-- Misc keymaps
keymap('<Esc><Esc>', '<c-\\><c-n>', 'Exit terminal mode', { mode = 't' })
keymap('<leader>m', ':Oil<cr>', 'Open file manager')
