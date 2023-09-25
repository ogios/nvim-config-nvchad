return function(on_attach, capabilities)
  require("lspconfig").powershell_es.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      powershell = {
        codeFormatting = {
          Preset = "OTBS",
        },
      },
    },
  }
end
