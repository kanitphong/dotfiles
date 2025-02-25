-- set leader key to space
vim.g.mapleader = ' '

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps --

-- use jk to exit insert mode
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })
-- keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- clear search highlights
keymap.set('n', '<Leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- increment/decrement numbers
keymap.set('n', '<Leader>+', '<C-a>', { desc = 'Increment number' }) -- increment
keymap.set('n', '<Leader>-', '<C-x>', { desc = 'Decrement number' }) -- decrement

-- window management
keymap.set('n', '<Leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<Leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontal
keymap.set('n', '<Leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal window
keymap.set('n', '<Leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

keymap.set('n', '<Leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
keymap.set('n', '<Leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
keymap.set('n', '<Leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) -- go to next tab
keymap.set('n', '<Leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) -- go to previous tab
keymap.set('n', '<Leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) -- move current buffer to new tab

-- My custom keymaps
keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file', silent = true }) -- save file
keymap.set('n', '<Leader>sn', '<cmd>noautocmd w<CR>', { desc = 'Save file without formatting', silent = true }) -- save file without auto-formatting
keymap.set('n', '<C-q>', '<cmd>q<CR>', { desc = 'Quit file', silent = true }) -- quit file
keymap.set('n', 'x', '"_x', { desc = 'Delete single character without copying into register' }) -- delete single character without copying into register
keymap.set('v', 'p', '"_dP', { desc = 'Keep last yank when pasting' }) -- Keep last yank when pasting
-- Vertical scrioll and center
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Vertical scroll down and center' })
keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Vertical scroll up and center' })
-- Find and center
keymap.set('n', 'n', 'nzz', { desc = 'Find next and center' })
keymap.set('n', 'N', 'Nzz', { desc = 'Find previous and center' })
-- Buffers
-- keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
-- keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })
-- keymap.set('n', '<Leader>x', ':Bdelete!<CR>', { desc = 'Close buffer' })
-- keymap.set('n', '<Leader>b', '<cmd>enew<CR>', { desc = 'New buffer' })
local opts = { noremap = true, silent = true }
keymap.set('n', '<Tab>', ':bnext<CR>', opts)
keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
keymap.set('n', '<Leader>x', ':bdelete!<CR>', opts) -- close buffer
keymap.set('n', '<Leader>b', '<cmd> enew <CR>', opts) -- new buffer

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'No operation', silent = true }) -- no operation
keymap.set('n', '<Leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrap' }) -- toggle line wrap
-- Stay indent mode
keymap.set('v', '<', '<gv', { desc = 'Indent left' }) -- indent left
keymap.set('v', '>', '>gv', { desc = 'Indent left' }) -- indent right
