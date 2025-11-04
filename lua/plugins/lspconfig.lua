return {

   'neovim/nvim-lspconfig',
   dependencies = {
      'williamboman/mason.nvim',
      cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
   },
   config = function()
      require('mason').setup()

      local lspc = vim.lsp.config
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local servers = {
         'lua-language-server',
         'bash-language-server',
         'bashls',
         'lua_ls',
      }
      vim.lsp.enable(servers)
      -- Lua
      lspc('lua_ls', {
         capabilities = capabilities,
         settings = {
            Lua = {
               diagnostics = { globals = { 'vim' } },
            },
         },
      })

      -- Python
      lspc('pyright', { capabilities = capabilities })

      -- Keymaps
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
   end,
}
