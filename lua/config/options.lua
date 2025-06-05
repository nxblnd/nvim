local opt = vim.opt

-- Enable mouse for all modes
opt.mouse = 'a'

-- Reload file on external changes
opt.autoread = true

-- Save undo history
opt.undofile = true

-- Number of lines before/after cursor during scroll
opt.scrolloff = 6

-- Work with tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Auto indent code
opt.smartindent = true

-- Number lines: current line number + relative numbers on other lines
opt.number = true
opt.relativenumber = true

-- Highligh current line
opt.cursorline = true

-- Ignore case during search
opt.ignorecase = true
opt.smartcase = true

-- Highlight matching brace
opt.showmatch = true

-- Enable full color support
opt.termguicolors = true

-- Sync with system clipboard
opt.clipboard = 'unnamedplus'

-- Show invisible characters and change some of them
opt.list = true
opt.listchars = {
    tab = '⇥ ',
    multispace = '·',
    lead = ' ',
    trail = '·',
    extends = '→',
    precedes = '←',
    nbsp = '⎵',
    conceal = '…',
}

-- Decrease timeouts
opt.updatetime = 250
opt.timeoutlen = 250

-- Do not unload hidden buffers
opt.hidden = true

-- Configure default split direction
opt.splitright = true
opt.splitbelow = true

--------------------------------------
-- Setup russian input for normal mode
--------------------------------------

-- https://github.com/Wansmer/langmapper.nvim#settings

local function escape(str)
  -- You need to escape these characters to work correctly
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

opt.langmap = vim.fn.join({
    -- | `to` should be first     | `from` should be second
    escape(ru_shift) .. ';' .. escape(en_shift),
    escape(ru) .. ';' .. escape(en),
}, ',')
