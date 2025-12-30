return {
   {
      'nvim-treesitter/nvim-treesitter',
      event = { 'VeryLazy', 'BufReadPost', 'BufNewFile' },
      cmd = {
         'TSUpdate',
         'TSInstall',
         'TSLog',
         'TSUninstall',
         'TSInstall',
         'TSBufEnable',
         'TSBufDisable',
         'TSModuleInfo',
      },
      build = ':TSUpdate',
      opts = {
         indent = { enable = true },
         highlight = { enable = true, use_languagetree = true },
         folds = { enable = true },
         ensure_installed = {
            'c',
            'bash',
            'lua',
            'python',
            'html',
            'javascript',
            'json',
            'lua',
            'markdown',
            'markdown_inline',
            'query',
            'regex',
         },
      },
      config = function()
         require('nvim-treesitter.configs').setup({
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
               enable = true,
               keymaps = {
                  init_selection = '<C-h>',
                  node_incremental = '<C-h>',
                  scope_incremental = '<C-k>',
               },
            },
         })
      end,
   },
   {
      'nvim-treesitter/nvim-treesitter-textobjects',
      branch = 'main',
      event = 'VeryLazy',
      opts = {
         move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            -- LazyVim extention to create buffer-local keymaps
            keys = {
               goto_next_start = { ['ef'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
               goto_next_end = { ['eF'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
               goto_previous_start = {
                  ['mf'] = '@function.outer',
                  ['mc'] = '@class.outer',
                  ['ma'] = '@parameter.inner',
               },
               goto_previous_end = {
                  ['mF'] = '@function.outer',
                  ['mC'] = '@class.outer',
                  ['mA'] = '@parameter.inner',
               },
            },
         },
         config = function(_, opts)
            local TS = require('nvim-treesitter-textobjects')
            local notify = require('mini.notify')
            if not TS.setup then
               notify.add('Please use `:Lazy` and update `nvim-treesitter`')
               return
            end
            TS.setup(opts)

            local function attach(buf)
               local moves = vim.tbl_get(opts, 'move', 'keys') or {}

               for method, keymaps in pairs(moves) do
                  for key, query in pairs(keymaps) do
                     local queries = type(query) == 'table' and query or { query }
                     local parts = {}
                     for _, q in ipairs(queries) do
                        local part = q:gsub('@', ''):gsub('%..*', '')
                        part = part:sub(1, 1):upper() .. part:sub(2)
                        table.insert(parts, part)
                     end
                     local desc = table.concat(parts, ' or ')
                     desc = (key:sub(1, 1) == '[' and 'Prev ' or 'Next ') .. desc
                     desc = desc .. (key:sub(2, 2) == key:sub(2, 2):upper() and ' End' or ' Start')
                     if not (vim.wo.diff and key:find('[cC]')) then
                        vim.keymap.set({ 'n', 'x', 'o' }, key, function()
                           require('nvim-treesitter-textobjects.move')[method](query, 'textobjects')
                        end, {
                           buffer = buf,
                           desc = desc,
                           silent = true,
                        })
                     end
                  end
               end
            end

            vim.api.nvim_create_autocmd('FileType', {
               group = vim.api.nvim_create_augroup('lazyvim_treesitter_textobjects', { clear = true }),
               callback = function(ev)
                  attach(ev.buf)
               end,
            })
            vim.tbl_map(attach, vim.api.nvim_list_bufs())
         end,
      },
   },
}
