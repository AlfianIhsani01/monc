return {
   {
      'numToStr/Comment.nvim',
      event = 'User FilePost',
      config = function()
         require('Comment').setup()
      end,
   },
   {
      'nvim-mini/mini.align',
      event = 'User FilePost',
      config = function()
         require('mini.align').setup()
      end,
   },
   {
      'nvim-mini/mini.pairs',
      version = '*',
      config = function()
         require('mini.pairs').setup()
      end,
   },
   {
      'nvim-mini/mini.operators',
      version = '*',
      event = 'UiEnter',
      config = function()
         require('mini.operators').setup()
      end,
   },
   {
      'nvim-mini/mini.surround',
      event = 'User FilePost',
      version = '*',
      config = function()
         require('mini.surround').setup()
      end,
   },
   {
      'nvim-mini/mini.jump2d',
      version = '*',
      config = function()
         require('mini.jump2d').setup()
      end,
   },
   {
      'nvim-mini/mini.splitjoin',
      version = '*',
      config = function()
         require('mini.splitjoin').setup({
            mappings = {
               toggle = 'gS',
               split = '',
               join = '',
            },

            -- Detection options: where split/join should be done
            detect = {
               -- Array of Lua patterns to detect region with arguments.
               -- Default: { '%b()', '%b[]', '%b{}' }
               brackets = nil,

               -- String Lua pattern defining argument separator
               separator = ',',

               -- Array of Lua patterns for sub-regions to exclude separators from.
               -- Enables correct detection in presence of nested brackets and quotes.
               -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
               exclude_regions = nil,
            },

            -- Split options
            split = {
               hooks_pre = {},
               hooks_post = {},
            },

            -- Join options
            join = {
               hooks_pre = {},
               hooks_post = {},
            },
         })
      end,
   },
   {
      'nvim-mini/mini.move',
      version = '*',
      event = 'User FilePost',
      config = function()
         require('mini.move').setup({
            mappings = {
               -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
               left = '<C-n>',
               right = '<C-i>',
               down = '<C-e>',
               up = '<C-u>',

               -- Move current line in Normal mode
               line_left = '<C-n>',
               line_right = '<C-i>',
               line_down = '<C-e>',
               line_up = '<C-u>',
            },

            -- Options which control moving behavior
            options = {
               -- Automatically reindent selection during linewise vertical move
               reindent_linewise = true,
            },
         })
      end,
   },
}
