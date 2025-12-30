return {

   'neovim/nvim-lspconfig',
   config = function()
      local lspc = vim.lsp.config
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local util = require('lspconfig.util')
      local servers = {
         'bashls',
         'html',
         'lua_ls',
         'denols',
         'biome',
         'clangd',
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

      -- shellcheck
      lspc('bashls', {
         filetypes = { 'sh', 'zsh', 'bash' }, -- Add any other relevant file types
         root_markers = { '.git' },
      })

      --[[ javascript ]]
      -- Biome
      lspc('biome', {
         cmd = { 'biome', 'lsp-proxy' },
         capabilities = capabilities,
         root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            local root_files = { 'biome.json', 'biome.jsonc', '.git' }
            root_files = util.insert_package_json(root_files, 'biome', fname)
            local root_dir = vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1])
            on_dir(root_dir)
         end,
      })

      -- deno
      lspc('denols', {
         root_markers = { 'deno.json', 'deno.jsonc', '.git' },
      })

      -- clang
      lspc('clangd', {
         filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
         root_markers = {
            '.clangd',
            '.clang-tidy',
            '.clang-format',
            'compile_commands.json',
            'compile_flags.txt',
            'configure.ac', -- GNU Autotools.
         },
      })
   end,
}
