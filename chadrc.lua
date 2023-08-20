--@type ChadrcConfig 
local M = {}
M.ui = {
  theme_toggle = { "palenight", "tokyonight" },
  theme = 'palenight',
  nvdash = require("custom.configs.nvdash_conf"),
  -- transparency = true,
  lsp_semantic_tokens = true,
}
M.plugins = 'custom.plugins'
M.mappings = {}

M.mappings = require "custom.configs.mapping"
return M
