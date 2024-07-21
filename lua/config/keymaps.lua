local keymap = vim.keymap

keymap.set('n', '<Leader>o', 'o<Esc>o', { desc = 'Add 2 lines below and go into Insert mode' })
keymap.set('n', '<Leader>O', 'O<Esc>O', { desc = 'Add 2 lines above and go into Insert mode' })

keymap.set('n', '<Leader>h', ':bnext<cr>', { desc = 'Go to next buffer' })
keymap.set('n', '<Leader>l', ':bprevious<cr>', { desc = 'Go to previous buffer' })


keymap.set('n', '<Leader>g', ':Neogit<cr>', { desc = 'Open Neogit' })
keymap.set('n', '<Leader>Gl', ':Neogit log<cr>b<cr>', { desc = 'Open Neogit log' })
