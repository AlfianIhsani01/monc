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
      'folke/tokyonight.nvim',
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
      'nvim-mini/mini.icons',
      version = '*',
      event = 'BufEnter',
      config = function()
         require('mini.icons').setup()
         require('mini.icons').mock_nvim_web_devicons()
      end,
   },

   {
      'nvim-mini/mini.hipatterns',
      version = '*',
      event = 'BufReadPre',
      config = function()
         local hipatterns = require('mini.hipatterns')
         hipatterns.setup({
            highlighters = {
               -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
               fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
               hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
               todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
               note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

               -- Highlight hex color strings (`#rrggbb`) using that color
               hex_color = hipatterns.gen_highlighter.hex_color(),
            },
         })
      end,
   },
   {

      'j-hui/fidget.nvim',
      version = '*',
      config = function()
         require('fidget').setup({
            notification = {
               window = {
                  normal_hl = 'Comment', -- Base highlight group in the notification window
                  winblend = 30, -- Background color opacity in the notification window
                  border = 'none', -- Border around the notification window
                  align = 'bottom', -- How to align the notification window
                  -- e.g., { "aerial", "NvimTree", "neotest-summary" }
               },
            },
         })
      end,
   },
}
