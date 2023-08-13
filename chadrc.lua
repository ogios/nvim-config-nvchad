--@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'palenight',
  nvdash = require("custom.configs.nvdash_conf"),
}
M.plugins = 'custom.plugins'
M.mappings = {}

M.mappings = require "custom.configs.mapping"
return M
