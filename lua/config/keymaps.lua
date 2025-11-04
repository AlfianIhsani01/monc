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

-- up, down, left, right
map('', 'n', 'h', { desc = 'Left' })
map('', 'i', 'l', { desc = 'Right', noremap = false })
map('', 'u', 'k', { desc = 'Up' })
map('', 'e', 'j', { desc = 'Down' })
map('', 'N', 'B', { desc = 'N WORDS backward' })
map('', 'I', 'E', { desc = 'forward to the end of WORD N' })
map('', 'U', '{', { desc = 'N paragraphs backward' })
map('', 'E', '}', { desc = 'N paragraphs forward' })

-- word navigation keys
map('', '<C-y>', 'e', { desc = 'forward to the end of the nth word' })
map('', '<C-Y>', 'E', { desc = 'forward to the end of the nth blank-separated word' })
map('', '<C-l>', 'ge', { desc = 'backward to the end of the nth word' })
map('', '<C-L>', 'gE', { desc = 'backward to the end of the nth blank-separated word' })
map('n', 'y', 'viw')
map('v', 'y', 'e', { desc = 'N words forward' })
map('n', 'Y', 'vib', { desc = 'N blank-separated WORDs forward' })
map('v', 'Y', 'E', { desc = 'N blank-separated WORDs forward' })
map('n', 'l', 'viwo', { desc = 'N words backward' })
map('v', 'l', 'b', { desc = 'N words backward' })
map('n', 'L', 'viWo', { desc = 'N blank-separated WORDs backward' })
map('v', 'L', 'B', { desc = 'N blank-separated WORDs backward' })

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', '`', '<ESC>', { noremap = false })

map({ 'n', 'v' }, 'j', 'J', { desc = 'join line' })

-- moving line
map('n', '<C-u>', 'line(".")>1 ? ":m .-2<CR>" : ""', { expr = true, silent = true }, { desc = 'Move line up' })
map(
   'n',
   '<C-e>',
   'line(".")<line("$") ? ":m .+1<CR>" : ""',
   { expr = true, silent = true },
   { desc = 'Move line down' }
)
map('v', '<C-u>', 'line(".")>1 ? ":m \'<-2<CR>gv" : ""', { expr = true, silent = true }, { desc = 'Move line up' })
map(
   'v',
   '<C-e>',
   'line(".")<line("$") ? ":m \'>+1<CR>gv" : ""',
   { expr = true, silent = true },
   { desc = 'Move line down' }
)
map('i', '<C-e>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<C-u>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })

map('c', '<C-u>', '<Up>')
map('c', '<C-e>', '<Down>')

-- Better Indenting
map('x', '<C-n>', '<gv')
map('x', '<C-i>', '>gv')
map('x', '<', '<gv')
map('x', '>', '>gv')

-- INSERT MODE KEYS
map('n', 't', function()
   return #vim.fn.getline('.') == 0 and '"_cc' or 'i'
end, { expr = true }, { desc = 'Insert' })
map('v', 't', 'o', { desc = 'Insert' })
map('v', 'T', 'o')
map('', 's', 'o')
map('', 'S', 'O')

map('n', '<C-n>', ':<<cr>', { desc = 'Insert in start of line' })
map('i', '<C-n>', '<Esc>I', { desc = 'Move to start of line' })
map('n', '<C-i>', ':><cr>', { desc = 'Insert in end of line' })
map('i', '<C-i>', '<Esc>A', { desc = 'Move to end of line' })

map('i', '<C-l>', '<C-w>')
map('i', '<C-y>', '<C-e>')

-- VISUAL MODE
map('', 'o', 'V', { desc = 'Select a line' })
map('', 'O', 'viB')
map('x', 'O', '<esc>vib')
map('', 'h', 'v')
map('', 'H', '<C-v>')

-- G KEY
map('', 'gs', 'gv')
map('', 'gS', 'gV')
map('', 'gt', 'gi', { desc = 'go to last insert' })
map('', 'ge', 'G', { desc = 'down N screen lines' })
map('', 'gu', 'gg', { desc = 'up N screen lines' })

-- left, down, up, right
map('', 'gi', 'g$a')
map('', 'gn', 'g^i')

-- commenting
map('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
map('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })
-- replace
-- map('', 'v', 'r')
-- map('', 'V', 'R')

-- redo, undo
map('', 'b', 'u', { desc = 'Undo' })
map('', 'B', '<C-r>', { desc = 'Redo' })
-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- yank, paste
map('', 'w', 'y')
map('', 'W', 'Y')
map('x', 'P', '"_dP')
map('x', 'p', '"_dp')

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

map('v', '=', function()
   require('config.utils').search(false)
end, { silent = true })
map('v', '-', function()
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

map('', '<C-a>', 'ggVG$')
map({ 'i', 'v' }, '<C-a>', '<Esc>ggVG$')

map('', '<C-r>', ':filetype detect<CR>', { silent = true })
map('i', '<C-r>', '<Esc>:filetype detect<CR>a', { silent = true })

map('', '<C-->', '<C-a>')
map({ 'i', 'v' }, '<C-->', '<Esc><C-a>a')
map('', '<C-=>', '<C-x>')
map({ 'i', 'v' }, '<C-=>', '<Esc><C-x>a')
map('n', '<leader>vp', function()
   require('lazy').profile()
end, { desc = 'View lazy profile' })
map(
   'n',
   '<C-j>',
   '<cmd>set wrap!<CR>',
   { desc = 'toggle line wrap', silent = true },
   { desc = 'Toggle line wrap for current buffer' }
)
map('n', '<leader>vd', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
