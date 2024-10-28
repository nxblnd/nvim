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

-- Neogit keymaps
keymap.set('n', '<Leader>g', ':Neogit<cr>', { desc = 'Open Neogit' })
keymap.set('n', '<Leader>Gl', ':Neogit log<cr>b<cr>', { desc = 'Open Neogit log' })

-- Telescope keymaps
local t_builtin = require('telescope.builtin')
if t_builtin then
    keymap.set('n', '<Leader>sh', t_builtin.help_tags, { desc = 'Search help' })
    keymap.set('n', '<Leader>sf', t_builtin.find_files, { desc = 'Search files' })
    keymap.set('n', '<Leader>sg', t_builtin.live_grep, { desc = 'Search by grep' })
    keymap.set('n', '<Leader>sw', t_builtin.grep_string, { desc = 'Search word under cursor' })
    keymap.set('n', '<Leader>sr', t_builtin.resume, { desc = 'Search resume' })
    keymap.set('n', '<Leader>so', t_builtin.oldfiles, { desc = 'Search previously open files' })
    keymap.set('n', '<Leader><Leader>', t_builtin.buffers, { desc = 'Search open buffers' })
end

-- Misc keymaps
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
