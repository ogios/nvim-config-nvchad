--@type ChadrcConfig 
local M = {}
M.ui = {
  theme_toggle = { "catppuccin", "tokyonight" },
  theme = 'catppuccin',
  nvdash = require("custom.configs.nvdash"),
  -- transparency = true,
  lsp_semantic_tokens = true,



  telescope = { style = "bordered" }, -- borderless / bordered
}
M.plugins = 'custom.plugins'
M.mappings = {}

M.mappings = require "custom.configs.mapping"
return M
