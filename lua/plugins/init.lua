return {
   {
      'nvim-mini/mini.notify',
      version = '*',
      config = function()
         require('mini.notify').setup()
      end,
   },
   {
      'nvim-mini/mini.starter',
      version = '*',
      config = function()
         require('mini.starter').setup()
      end,
   },
   {
      'nvim-mini/mini.files',
      -- enable = false,
      version = '*',
      event = 'BufEnter',
      cmd = { 'MiniFiles' },
      config = function()
         -- require('mini.files').setup()
         local miniFiles = require('mini.files')
         miniFiles.setup({
            -- Customization of shown content
            content = {
               filter = nil,
               highlight = nil,
               prefix = nil,
               sort = nil,
            },

            -- Moule mappings created only inside explorer.
            -- Use `''` (empty string) to not create one.
            mappings = {
               close = 'q',
               go_in = 'i',
               go_in_plus = 'I',
               go_out = 'n',
               go_out_plus = 'N',
               mark_goto = "'",
               mark_set = 'm',
               reset = '<BS>',
               reveal_cwd = '@',
               show_help = 'g?',
               synchronize = '=',
               trim_left = '<',
               trim_right = '>',
            },

            -- General options
            options = {
               -- Whether to delete permanently or move into module-specific trash
               permanent_delete = true,
               -- Whether to use for editing directories
               use_as_default_explorer = true,
            },

            -- Customization of explorer windows
            windows = {
               -- Maximum number of windows to show side by side
               max_number = math.huge,
               -- Whether to show preview of file/directory under cursor
               preview = false,
               -- Width of focused window
               width_focus = 50,
               -- Width of non-focused window
               width_nofocus = 15,
               -- Width of preview window
               width_preview = 25,
            },
         })
         -- stylua: ignore
         vim.keymap.set('', '<leader>E', '<cmd>lua MiniFiles.open()<cr>', { desc = 'Open Explorer' })
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
      'nvim-mini/mini.clue',
      version = '*',
      event = 'VeryLazy',
      config = function()
         local miniclue = require('mini.clue')
         miniclue.setup({
            triggers = {
               -- Leader triggers
               { mode = 'n', keys = '<Leader>' },
               { mode = 'x', keys = '<Leader>' },
               { mode = 'n', keys = '<Localleader>' },
               { mode = 'x', keys = '<Localleader>' },

               -- Built-in completion
               { mode = 'i', keys = '<C-x>' },

               -- `g` key
               { mode = 'n', keys = 'g' },
               { mode = 'x', keys = 'g' },

               -- visual mode
               { mode = 'n', keys = 'va' },
               { mode = 'n', keys = 'vi' },
               { mode = 'n', keys = '<C-y>' },
               { mode = 'n', keys = '<C-y>' },
               { mode = 'n', keys = '<C-l>' },
               { mode = 'n', keys = '<C-L>' },
               { mode = 'n', keys = '<C-y>' },
               { mode = 'n', keys = '<C-Y>' },
               { mode = 'x', keys = 'o' },
               { mode = 'n', keys = 'h' },
               { mode = 'x', keys = 'h' },

               -- Marks
               { mode = 'n', keys = "'" },
               { mode = 'n', keys = '`' },
               { mode = 'x', keys = "'" },
               { mode = 'x', keys = '`' },

               -- Registers
               { mode = 'n', keys = '"' },
               { mode = 'x', keys = '"' },
               { mode = 'i', keys = '<C-r>' },
               { mode = 'c', keys = '<C-r>' },

               -- Window commands
               { mode = 'n', keys = '<C-w>' },

               -- `z` key
               { mode = 'n', keys = 'z' },
               { mode = 'x', keys = 'z' },
            },

            clues = {
               -- Enhance this by adding descriptions for <Leader> mapping groups
               miniclue.gen_clues.builtin_completion(),
               miniclue.gen_clues.g(),
               miniclue.gen_clues.marks(),
               miniclue.gen_clues.registers(),
               miniclue.gen_clues.windows(),
               miniclue.gen_clues.z(),
            },
         })
      end,
   },
   {},
}
