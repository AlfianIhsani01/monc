return {
   'nvim-telescope/telescope.nvim',
   lazy = true,
   cmd = 'Telescope',
   keys = {
      { '<leader>f', desc = '+Find' },
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      -- { '<leader>fa', '<cmd>Telescope aerial<cr>', desc = 'Aerial' },
      {
         '<leader>fp',
         function()
            require('telescope.builtin').find_files({ cwd = require('lazy.core.config').options.root })
         end,
         desc = 'Find Plugin File',
      },
      config = function()
         require('telescope').setup({
            defaults = {
               cache_picker = {
                  num_pickers = 10, -- Cache last 10 picker searches
               },
               file_ignore_patterns = { 'node_modules', '.git/' },
            },
            pickers = {
               find_files = {
                  hidden = true,
                  find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
               },
            },
         })
      end,
   },
   opts = {
      defaults = {
         layout_strategy = 'horizontal',
         layout_config = { prompt_position = 'bottom' },
         sorting_strategy = 'ascending',
         winblend = 0,
      },
   },
}
