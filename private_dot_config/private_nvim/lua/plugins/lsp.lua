
return {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  dependencies = {
    'folke/neodev.nvim',
    'simrat39/rust-tools.nvim',
  	'nvimtools/none-ls.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  init = function() require('keymaps').setup.diagnostics() end,
  config = function()
    require('mason').setup({ ui = { border = 'single' } })


    require('neodev').setup({})
    require('mason-tool-installer').setup {
      ensure_installed = {
        'codespell',
        'cpptools',
        'gopls',
        -- 'html-lsp',
        -- 'json-lsp',
        -- 'ltex-ls',
        'lua-language-server',
        'marksman',
        'netcoredbg',
        'powershell-editor-services',
        'python-lsp-server',
        'rust-analyzer',
        -- 'shopify-theme-check',
        'stylua',
        'zls',
      },
    }

    local mason_lspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')
    mason_lspconfig.setup()
    -- mason_lspconfig.setup_handlers {
    --   function(ls) lspconfig[ls].setup(require('lsp-config')[ls]) end,
    --   rust_analyzer = function() require('rust-tools').setup() end,
    --   jdtls = function() end, -- use method recommended by nvim-jdtls @ ../../../ftplugin/java.lua
    -- }

    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        null_ls.builtins.completion.spell.with({
          filetypes = { 'markdown', 'text' },
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.hover.dictionary,
        null_ls.builtins.hover.printenv,
        null_ls.builtins.formatting.codespell
      },
    })

  end,
}
