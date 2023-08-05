--@type ChadrcConfig 
local M = {}
M.ui = {theme = 'catppuccin'}
M.plugins = 'custom.plugins'
M.mappings = {}
M.mappings.telescope = require('custom.configs.mapping').telescope
return M
