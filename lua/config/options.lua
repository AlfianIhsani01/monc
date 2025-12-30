-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.tex_flavor = 'latex'
opt.clipboard = 'unnamedplus'
opt.completeopt = 'menuone,noselect'
opt.cursorline = true
opt.cursorlineopt = 'screenline'
opt.encoding = 'utf-8'
opt.expandtab = true
opt.hlsearch = false
opt.ignorecase = true
opt.list = true
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 8
opt.shiftwidth = 3
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescroll = 1
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smoothscroll = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 250
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.whichwrap:append "<>[]hl"
opt.wildmode = 'noselect:longest,full' -- set the behavior of the completion menu
opt.wrap = false
opt.listchars = {
   nbsp = '°',
   precedes = '‥',
   tab = '› ',
   trail = '▒',
}
-- space = '·',
-- extends = '‥',
