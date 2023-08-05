

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"


lspconfig.jedi_language_server.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}


--[[
lspconfig.sourcery.setup({
  init_options = {
    token="user_nrQ5rsoGL9uHAFWAYoGe7GknVWZvorF6FdpdI8rxyTlp_pz6c7KswSMH4V8",
  },
  on_attach=on_attach,
  capabilities=capabilities,
})


require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}

require'lspconfig'.sourcery.setup {
    init_options = {
        --- The Sourcery token for authenticating the user.
        --- This is retrieved from the Sourcery website and must be
        --- provided by each user. The extension must provide a
        --- configuration option for the user to provide this value.
        token = "user_nrQ5rsoGL9uHAFWAYoGe7GknVWZvorF6FdpdI8rxyTlp_pz6c7KswSMH4V8",

        --- The extension's name and version as defined by the extension.
        extension_version = 'vim.lsp',

        --- The editor's name and version as defined by the editor.
        editor_version = 'vim',
    },
}
--]]
