-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.tex_flavor = 'latex'
vim.o.completeopt = 'menuone,noselect'
vim.o.cursorline = true
vim.o.cursorlineopt = 'screenline'
vim.o.encoding = 'utf-8'
vim.o.sidescroll = 1
vim.o.smoothscroll = true
vim.o.undofile = true
vim.o.wildmode = 'noselect:longest,full' -- set the behavior of the completion menu
vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 6
vim.opt.shiftwidth = 3
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.tabstop = 3
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250
vim.opt.wrap = false
vim.wo.list = true
vim.opt.listchars = {
   space = ' ', --'·',
   tab = '› ',
   trail = '⛝',
   extends = '»',
   precedes = '«',
   nbsp = '°',
}
