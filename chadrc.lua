--@type ChadrcConfig 
local M = {}
M.ui = {
  theme_toggle = { "nightowl", "tokyonight" },
  theme = 'nightowl',
  nvdash = require("custom.configs.nvdash"),
  -- transparency = true,
  lsp_semantic_tokens = true,
}
M.plugins = 'custom.plugins'
M.mappings = {}

M.mappings = require "custom.configs.mapping"
return M
