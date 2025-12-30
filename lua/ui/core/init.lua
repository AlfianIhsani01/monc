return {
   {
      'vague-theme/vague.nvim',
      lazy = true,
      priority = 1000,
      config = function()
         require('vague').setup({
            bold = true,
            italic = false,
         })
         -- vim.cmd('colorscheme vague')
      end,
   },
   {
      'cocopon/iceberg.vim',
      lazy = false,
      priority = 1000,
      config = function()
         -- vim.cmd('colorscheme vague')
      end,
   },
   {
      'embark-theme/vim',
      lazy = false,
      priority = 1000,
      name = 'embark',
      config = function()
         -- vim.cmd.colorscheme('embark')
      end,
   },
   {
      'rebelot/kanagawa.nvim',
      lazy = true,
      priority = 1000,
      config = function()
         require('kanagawa').setup({})
         -- vim.cmd('colorscheme kanagawa')
      end,
   },
   {
      'fenetikm/falcon',
      lazy = false,
      priority = 1000,
      config = function()
         vim.cmd('colorscheme falcon')
      end,
   },
   {
      'MunifTanjim/nui.nvim',
      lazy = true,
   },
   {
      'nvim-mini/mini.icons',
      version = '*',
      event = 'BufEnter',
      config = function()
         require('mini.icons').setup()
         require('mini.icons').mock_nvim_web_devicons()
      end,
   },
   {
      'uga-rosa/ccc.nvim',
      cmd = 'CccPick',
      opts = { bar_len = 60 },
   },
   {
      'nvim-mini/mini.indentscope',
      version = '*',
      event = 'User FilePost',
      config = function()
         require('mini.indentscope').setup({
            draw = {
               delay = 50,
               priority = 2,
            },
            mappings = {
               object_scope = 'a',
               object_scope_with_border = 'at',
               goto_top = '[u',
               goto_bottom = ']e',
            },
            options = {
               indent_at_cursor = false,
               n_lines = 600,
               try_as_border = true,
            },

            symbol = '⠨',
         })
      end,
   },
}
