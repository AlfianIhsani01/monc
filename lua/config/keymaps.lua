-- stylua: ignore start
local map = vim.keymap.set
-- local unmap = vim.keymap.del
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- n: Normal mode
-- i: Insert mode
-- v: Visual mode (including Select mode)
-- x: Visual mode (character-wise)
-- s: Select mode
-- o: Operator-pending mode
--'': All modes where a mapping is applicable. - c: Command-line mode
-- t: Terminal mode

local e = { 'n', 'x', 'o' } -- exclude select mode

map(e, ';', ':', { desc = 'CMD enter command mode' })
map('i', '<a-space>', '<ESC>', { noremap = false })

-- up, down, left, right
map(e, 'n', 'h', { desc = 'Left' })
map(e, 'i', 'l', { desc = 'Right' })
map(e, 'u', 'k', { desc = 'Up' })
map(e, 'e', 'j', { desc = 'Down' })
map(e, 'N', 'B', { desc = 'N WORDS backward' })
map(e, 'I', 'E', { desc = 'forward to the end of WORD N' })
map(e, 'U', '{', { desc = 'N paragraphs backward' })
map(e, 'E', '}', { desc = 'N paragraphs forward' })

-- Word Selection Keys
map('', '<C-y>', 'va', { desc = 'forward to the end of the nth word' })
map('', '<C-Y>', 'va', { desc = 'forward to the end of the nth blank-separated word' })
map('', '<C-l>', 'vi', { desc = 'backward to the end of the nth word' })
map('', '<C-L>', 'vi', { desc = 'backward to the end of the nth blank-separated word' })
map('n', 'y', 've')
map('x', 'y', 'e', { desc = 'N words forward' })
map('n', 'Y', 'viW', { desc = 'N blank-separated WORDs forward' })
map('x', 'Y', 'E', { desc = 'N blank-separated WORDs forward' })
map('n', 'l', 'vb', { desc = 'N words backward' })
map('x', 'l', 'b', { desc = 'N words backward' })
map('n', 'L', 'viWo', { desc = 'N blank-separated WORDs backward' })
map('x', 'L', 'B', { desc = 'N blank-separated WORDs backward' })

map(e,   'o', 'wviw')
map('x', 'o', '<esc>wviw')
map(e,   'O', 'bviw')
map('x', 'O', '<esc>bviwo')

-- Move to window using the <ctrl> hjkl keys
map('n', '<A-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
map('n', '<A-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
map('n', '<A-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
map('n', '<A-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Moving Lines (use mini.move instead)
-- map('n', '<C-u>', 'line(".")>1 ? ":m .-2<CR>" : ""', { expr = true, silent = true }, { desc = 'Move line up' })
-- map(
--    'n',
--    '<C-e>',
--    'line(".")<line("$") ? ":m .+1<CR>" : ""',
--    { expr = true, silent = true },
--    { desc = 'Move line down' }
-- )
-- map('v', '<C-u>', 'line(".")>1 ? ":m \'<-2<CR>gv" : ""', { expr = true, silent = true }, { desc = 'Move line up' })
-- map(
--    'v',
--    '<C-e>',
--    'line(".")<line("$") ? ":m \'>+1<CR>gv" : ""',
--    { expr = true, silent = true },
--    { desc = 'Move line down' }
-- )
-- map('i', '<C-e>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
-- map('i', '<C-u>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })

-- Better Indenting
map('x', '<C-n>', '<gv')
map('x', '<C-i>', '>gv')
map('x', '<', '<gv')
map('x', '>', '>gv')

-- Command Line
map('c', '<C-u>', '<Up>')
map('c', '<C-e>', '<Down>')

-- INSERT MODE
map(e, 't', 'i', { desc = 'Insert' })
map(e, 'T', 'I', { desc = 'Insert' })
map('n', 't', function()
   return #vim.fn.getline('.') == 0 and '"_cc' or 'i'
end, { expr = true }, { desc = 'Insert' })
map(e, 's', 'o')
map(e, 'S', 'O')

map('i', '<C-n>', '<Esc>I', { desc = 'Move to start of line' })
map('i', '<C-i>', '<Esc>A', { desc = 'Move to end of line' })

map('i', '<C-l>', '<C-w>')
map('i', '<C-y>', '<C-e>')

-- VISUAL MODE
-- map(e,   'K', 'vi')
map('x', 'k', 'v', { desc = 'Select a line' })
-- map('n',   'K', 'vi')
-- map('x', 'H', '<Esc>va')
map(e,   'k',     '<C-v>')
map('x', 'b',     'U')
map(e,   'H',     'V')
map('',  '<C-a>', 'ggVG$')

-- G KEYS
map('', 'gh', 'gv', { desc = 'Reselect the previous Visual area' })
map('', 'gH', 'gV', { desc = 'Reselect the previous Visual area' })
map('', 'gt', 'gi', { desc = 'Go to last insert' })
map('', 'ge', 'G', { desc = 'Down N screen lines' })
map('', 'gu', 'gg', { desc = 'Up N screen lines' })

map('', 'gi', 'g$a')
map('', 'gn', 'g^i')

-- Commenting
map('n', 'gce', 'j<esc><cmd>normal gcA<cr>a', { desc = 'Add Comment at eol Below' })
map('n', 'gcu', 'k<esc><cmd>normal gcA<cr>a', { desc = 'Add Comment at eol Above' })

-- Replace
-- map('', 'v', 'r')
-- map('', 'V', 'R')

-- redo, undo
map(e, 'b', 'u', { desc = 'Undo' })
map('', 'B', '<C-r>', { desc = 'Redo' })

-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')
map('i', ':', ':<c-g>u')

-- Yank, Paste
map(e, 'w', 'y')
map(e, 'W', 'Y')
-- map('x', 'P', '"_c<esc>P')
-- map('x', 'p', '"_c<esc>p')

-- Duplicate Line
map('', '<localleader>D', 'mayyp`a', { desc = 'Duplicate line' })
map('', '<localleader>d', 'mayyP`a', { desc = 'Duplicate line above' })

-- delete keys
map({ 'n', 'v' }, 'x', '"_x', { desc = 'delete N characters under cursor' })
map('n', 'dw', 'viw"_d', { desc = 'Delete word' })
map('n', 'cw', 'viw"_c', { desc = 'Change word' })

-- search keys
map('n', '=', "'Nn'[v:searchforward]", { expr = true })
map('x', '=', "'Nn'[v:searchforward]", { expr = true })
map('o', '=', "'Nn'[v:searchforward]", { expr = true })
map('n', '-', "'nN'[v:searchforward]", { expr = true })
map('x', '-', "'nN'[v:searchforward]", { expr = true })
map('o', '-', "'nN'[v:searchforward]", { expr = true })

map('x', '=', function()
   require('config.utils').search(false)
end, { silent = true })
map('x', '-', function()
   require('config.utils').search(true)
end, { silent = true })

-- save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- tab management
map({ 'n', 'v' }, '<leader>tt', ':tabe<CR>', { silent = true })
map({ 'n', 'v' }, '<leader>tT', ':tab split<CR>', { silent = true })
map({ 'n', 'v' }, '<leader>tn', ':-tabnext<CR>', { silent = true })
map({ 'n', 'v' }, '<leader>ti', ':+tabnext<CR>', { silent = true })
map({ 'n', 'v' }, '<leader>tN', ':-tabmove<CR>', { silent = true })
map({ 'n', 'v' }, '<leader>tI', ':+tabmove<CR>', { silent = true })

map('n', '<Tab>', '<Cmd> bn<Cr>')
map('n', '<S-Tab>', '<Cmd> bp<Cr>')

-- other keys
map('n', '<C-S-M-s>', ':up<CR>', { silent = true })
map('i', '<C-S-M-s>', '<Esc>:up<CR>a', { silent = true })
map('v', '<C-S-M-s>', '<Esc>:up<CR>', { silent = true })

map({ 'i', 'v' }, '<C-a>', '<Esc>ggVG$')

map('', '<C-r>', ':filetype detect<CR>', { silent = true })
map('i', '<C-r>', '<Esc>:filetype detect<CR>a', { silent = true })

map('', '<C-->', '<C-a>')
map({ 'i', 'v' }, '<C-->', '<Esc><C-a>a')
map('', '<C-=>', '<C-x>')
map({ 'i', 'v' }, '<C-=>', '<Esc><C-x>a')
map('n', '<leader>vp', function()
   require('config.lazy').profile()
end, { desc = 'View lazy profile' })
map(
   'n',
   '<C-j>',
   '<cmd>set wrap!<CR>',
   { desc = 'toggle line wrap', silent = true },
   { desc = 'Toggle line wrap for current buffer' }
)
map('n', '<leader>vd', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- stylua: ignore end
