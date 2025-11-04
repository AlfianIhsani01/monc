return {
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
         require('mini.files').setup()
         vim.keymap.set('n', '<leader>E', function()
            require('mini.files').open()
         end, { desc = 'Open Explorer' })
      end,
   },
   {
      'nvim-mini/mini.move',
      version = '*',
      event = 'User FilePost',
      config = function()
         require('mini.move').setup()
      end,
   },
   {
      'nvim-mini/mini.clue',
      version = '*',
      lazy = true,
      keys = { '<Leader>', '<Localleader>', 'g', 'r', 'c', 'w', 'd', 'o', 'h' },
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
}
