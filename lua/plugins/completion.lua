return {
   'saghen/blink.cmp',
   event = 'InsertEnter',
   dependencies = 'rafamadriz/friendly-snippets',
   version = '*',
   opts = {
      keymap = {
         preset = 'default',
         ['<C-.>'] = { 'show', 'show_documentation', 'hide_documentation' },
         ['<C-,>'] = { 'hide' },
         ['<Cr>'] = { 'accept', 'fallback' },
         ['<Tab>'] = { 'select_next', 'fallback' },
         ['<S-Tab>'] = { 'select_prev', 'fallback' },
         ['<C-U>'] = { 'scroll_documentation_up', 'fallback' },
         ['<C-E>'] = { 'scroll_documentation_down', 'fallback' },
      },
      appearance = {
         use_nvim_cmp_as_default = true,
         nerd_font_variant = 'mono',
      },
      sources = {
         default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
         menu = {
            auto_show = true,
            draw = {
               columns = {
                  { 'label', 'label_description', gap = 1 },
                  { 'kind_icon', gap = 1, 'kind' },
               },
            },
         },
         list = {
            selection = {
               preselect = false, -- or 'preselect' or 'manual'
               auto_insert = true,
            },
         },
         documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
         },
      },
   },
}
