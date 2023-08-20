local M = {}
M.cmp_lsp_capabilities = {
  textDocument = {
    completion = {
      dynamicRegistration = true,
      completionItem = {
        snippetSupport = true,
        commitCharactersSupport = true,
        deprecatedSupport = true,
        preselectSupport = true,
        tagSupport = { valueSet = { 1 } },
        insertReplaceSupport = true,
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
        insertTextModeSupport = {
          valueSet = {
            1, -- asIs
            2, -- adjustIndentation
          },
        },
        labelDetailsSupport = true,
      },
      contextSupport = true,
      insertTextMode = 1,
      completionList = {
        itemDefaults = {
          "commitCharacters",
          "editRange",
          "insertTextFormat",
          "insertTextMode",
          "data",
        },
      },
    },
  },
}

M.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), M.cmp_lsp_capabilities)

return M
