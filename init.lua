require("custom.vimopt")
require("custom.ftplugin.python")
require("custom.ftplugin.go")
require("custom.keymap")
require("custom.configs.go_conf")

if vim.g.neovide then
	require("custom.neovide")
end
