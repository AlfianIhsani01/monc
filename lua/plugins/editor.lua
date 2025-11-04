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
         require('mini.align').setup({})
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
      'windwp/nvim-autopairs',
      event = 'User FilePost',
      config = function()
         require('nvim-autopairs').setup()
      end,
   },
   {
      'lewis6991/gitsigns.nvim',
      event = 'BufEnter',
      config = function()
         require('gitsigns').setup({
            _refresh_staged_on_update = false, -- Don't refresh constantly
            update_debounce = 200, -- Debounce updates
            max_file_length = 10000, -- Skip large files
         })
      end,
   },
   {
      'nvim-mini/mini.indentscope',
      version = '*',
      event = 'User FilePost',
      opts = {
         -- Draw options
         draw = {
            -- Delay (in ms) between event and start of drawing scope indicator
            delay = 50,
            priority = 2,
         },

         -- Module mappings. Use `''` (empty string) to disable one.
         mappings = {
            -- Textobjects
            object_scope = 'o',
            object_scope_with_border = 'oi',

            -- Motions (jump to respective border line; if not present - body line)
            goto_top = '[o',
            goto_bottom = ']o',
         },

         -- Which character to use for drawing scope indicator
         symbol = '⠨',
      },
      -- end,
   },
}
