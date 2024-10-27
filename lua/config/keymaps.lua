local keymap = vim.keymap

-- Better 'o' and 'O'
keymap.set('n', '<Leader>o', 'o<Esc>o', { desc = 'Add 2 lines below and go into Insert mode' })
keymap.set('n', '<Leader>O', 'O<Esc>O', { desc = 'Add 2 lines above and go into Insert mode' })

-- Buffer navigation keymaps
keymap.set('n', '<Leader>h', ':bnext<cr>', { desc = 'Go to next buffer' })
keymap.set('n', '<Leader>l', ':bprevious<cr>', { desc = 'Go to previous buffer' })

-- Split navigation keymaps
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left split' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to lower split' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to upper split' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right split' })

-- Git keymaps
keymap.set('n', '<Leader>g', ':Neogit<cr>', { desc = 'Open Neogit' })
keymap.set('n', '<Leader>Gl', ':Neogit log<cr>b<cr>', { desc = 'Open Neogit log' })

-- Misc keymaps
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
