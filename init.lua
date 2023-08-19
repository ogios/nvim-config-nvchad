require("custom.vimopt")
require("custom.keymap")
-- require("custom.configs.go_conf")

if vim.g.neovide then
	require("custom.neovide")
end

vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"
