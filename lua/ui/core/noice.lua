return {
   'folke/noice.nvim',
   event = 'VeryLazy',
   dependencies = {
      'MunifTanjim/nui.nvim',
   },
   keys = {
      { '<leader>sn', '', desc = '+noice' },
      {
         '<S-Enter>',
         function()
            require('noice').redirect(vim.fn.getcmdline())
         end,
         mode = 'c',
         desc = 'Redirect Cmdline',
      },
      {
         '<leader>snl',
         function()
            require('noice').cmd('last')
         end,
         desc = 'Noice Last Message',
      },
      {
         '<leader>snh',
         function()
            require('noice').cmd('history')
         end,
         desc = 'Noice History',
      },
      {
         '<leader>sna',
         function()
            require('noice').cmd('all')
         end,
         desc = 'Noice All',
      },
      {
         '<leader>snd',
         function()
            require('noice').cmd('dismiss')
         end,
         desc = 'Dismiss All',
      },
      {
         '<leader>snt',
         function()
            require('noice').cmd('pick')
         end,
         desc = 'Noice Picker (Telescope/FzfLua)',
      },
      {
         '<c-f>',
         function()
            if not require('noice.lsp').scroll(4) then
               return '<c-f>'
            end
         end,
         silent = true,
         expr = true,
         desc = 'Scroll Forward',
         mode = { 'i', 'n', 's' },
      },
      {
         '<c-b>',
         function()
            if not require('noice.lsp').scroll(-4) then
               return '<c-b>'
            end
         end,
         silent = true,
         expr = true,
         desc = 'Scroll Backward',
         mode = { 'i', 'n', 's' },
      },
   },
   opts = {
      cmdline = {
         enabled = true,
         view = 'cmdline_popup',
         format = {
            cmdline = { pattern = '', icon = '󱐌 :', lang = 'vim' },
            help = { pattern = '^:%s*he?l?p?%s+', icon = ' 󰮦 :' },
            search_down = { kind = 'search', pattern = '^/', icon = '  :', lang = 'regex' },
            search_up = { kind = 'search', pattern = '^%?', icon = '  :', lang = 'regex' },
            filter = { pattern = '^:%s*!', icon = ' $ :', lang = 'bash' },
            lua = {
               pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' },
               icon = '  :',
               lang = 'lua',
            },
            input = { view = 'cmdline_input', icon = ' 󰥻 :' }, -- Used by input()
         },
      },
      views = {
         cmdline_popup = { -- Example for command line popup
            position = { row = 8, col = '50%' },
            size = { width = '75%', height = 'auto' },
            border = {
               text = {
                  top_align = 'left',
               },
               style = 'single',
            },
         },
      },
      lsp = {
         progress = {
            enabled = true,
            view = false,
         },
         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
         override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
         },
         signature = {
            auto_open = { enabled = true }, -- disable auto signature help on insert mode
         },
      },
      routes = {
         filter = {
            event = 'msg_show',
            any = {
               { find = '%d+L, %d+B' },
               { find = '; after #%d+' },
               { find = '; before #%d+' },
               { find = '%d fewer lines' },
               { find = '%d more lines' },
            },
         },
         opts = { skip = true },
         view = 'mini',
      },
      presets = {
         bottom_search = true,
         command_palette = true,
         long_message_to_split = true,
         inc_rename = false,
         lsp_doc_border = false,
      },
      messages = {
         enabled = true,
      },
      health = {
         checker = true,
      },
      popupmenu = {
         enabled = true,
      },
      signature = {
         enabled = true,
      },
   },
   config = function(_, opts)
      if vim.o.filetype == 'lazy' then
         vim.cmd([[messages clear]])
      end
      require('noice').setup(opts)
   end,
}
