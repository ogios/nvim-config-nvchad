local M = {}

M.lsp_highlight = function(client, bufnr)
  if client.supports_method "textDocument/documentHighlight" then
    -- vim.api.nvim_set_hl(0, "LspReferenceWrite", { link = "Visual" })
    -- vim.api.nvim_set_hl(0, "LspReferenceRead", { link = "Visual" })
    -- vim.api.nvim_set_hl(0, "LspReferenceText", { link = "Visual" })

    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })
    vim.api.nvim_clear_autocmds {
      buffer = bufnr,
      group = "lsp_document_highlight",
    }
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  else
    vim.notify("highlight word fatal")
  end
end

return M
