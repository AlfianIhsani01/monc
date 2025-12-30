return {
   'stevearc/conform.nvim',
   event = { 'BufWritePre' },
   keys = {
      { '<localleader>f', desc = '+Formatter' },
      {
         -- Customize or remove this keymap to your liking
         '<localleader>ff',
         '<cmd>Format<CR>',
         mode = '',
         desc = 'Format buffer',
      },
      {
         '<localleader>fv',
         function()
            require('conform').format({ async = true }, function(err)
               if not err then
                  local mode = vim.api.nvim_get_mode().mode
                  if vim.startswith(string.lower(mode), 'v') then
                     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
                  end
               end
            end)
         end,
         mode = '',
         desc = 'Format code',
      },
      {
         '<leader>ft',
         ':FormatToggle<CR>',
         mode = '',
         desc = 'Toggle autoformat',
      },
   },
   opts = {
      formatters_by_ft = {
         lua = { 'stylua' },
         -- Conform will run the first available formatter
         javascript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
         sh = { 'shfmt' },
      },
      -- stylua: ignore
      formatters = {
         shfmt = { append_args = {
            '-i=3', }},
         biome = { append_args = {
            'format' }},

      },
      -- format_on_save = function(bufnr)
      --    -- Disable with a global or buffer-local variable
      --    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      --       return
      --    end
      --    return { timeout_ms = 500, lsp_format = 'fallback' }
      -- end,
   },
   cmd = {
      'ConformInfo',
      -- Format Command
      vim.api.nvim_create_user_command('Format', function(args)
         local range = nil
         if args.count ~= -1 then
            local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
            range = {
               start = { args.line1, 0 },
               ['end'] = { args.line2, end_line:len() },
            }
         end
         require('conform').format({ async = true, lsp_format = 'fallback', range = range })
      end, { range = true }),

      -- Format on Save Toggle
      vim.api.nvim_create_user_command('FormatToggle', function(args)
         if args.bang then
            -- FormatToggle! toggles for current buffer only
            vim.b.disable_autoformat = not vim.b.disable_autoformat
            if vim.b.disable_autoformat then
               print('Auto-format disabled for current buffer')
            else
               print('Auto-format enabled for current buffer')
            end
         else
            -- FormatToggle toggles globally
            vim.g.disable_autoformat = not vim.g.disable_autoformat
            if vim.g.disable_autoformat then
               print('Auto-format disabled globally')
            else
               print('Auto-format enabled globally')
            end
         end
      end, {
         desc = 'Toggle autoformat-on-save',
         bang = true,
      }),
      vim.api.nvim_create_user_command('FormatDisable', function(args)
         if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
         else
            vim.g.disable_autoformat = true
         end
      end, {
         desc = 'Disable autoformat-on-save',
         bang = true,
      }),
      vim.api.nvim_create_user_command('FormatEnable', function()
         vim.b.disable_autoformat = false
         vim.g.disable_autoformat = false
      end, {
         desc = 'Re-enable autoformat-on-save',
      }),
   },
}
