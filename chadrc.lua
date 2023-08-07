--@type ChadrcConfig 
local M = {}
M.ui = {theme = 'palenight'}
M.plugins = 'custom.plugins'
M.mappings = {}
M.mappings.telescope = require('custom.configs.mapping').telescope
return M
