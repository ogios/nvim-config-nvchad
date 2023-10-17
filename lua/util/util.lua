local M = {
  is_disabled = function(client)
    return require("neoconf").get(client .. ".disable")
  end,
}

return M
