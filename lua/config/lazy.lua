-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
   local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
   if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
         { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
         { out, 'WarningMsg' },
         { '\nPress any key to exit...' },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
   end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup({
   spec = {
      -- import your plugins
      { import = 'plugins' },
      { import = 'ui' },
   },
   performance = {
      cache = {
         enabled = true,
      },
      reset_packpath = true,
      rtp = {
         reset = true,
         paths = {},
         disabled_plugins = {
            '2html_plugin',
            'bugreport',
            'compiler',
            'ftplugin',
            'fzf',
            'getscript',
            'getscriptPlugin',
            'gzip',
            'logipat',
            'matchit',
            'matchparen',
            'netrw',
            'netrwFileHandlers',
            'netrwPlugin',
            'netrwSettings',
            'optwin',
            'rplugin',
            'rrhelper',
            'spellfile_plugin',
            'synmenu',
            'syntax',
            'tar',
            'tarPlugin',
            'tohtml',
            'tutor',
            'vimball',
            'vimballPlugin',
            'zip',
            'zipPlugin',
         },
      },
   },
   -- Configure any other settings here. See the documentation for more details.
   -- colorscheme that will be used when installing plugins.
   install = { colorscheme = { 'vague' } },
   checker = { enabled = true, notify = false },
})
