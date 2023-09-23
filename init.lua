vim.o.guifont = "JetBrainsMonoNL Nerd Font Mono"
vim.g.guifont = "JetBrainsMonoNL Nerd Font Mono"
require("custom.vimopt")
require("custom.keymap")
-- require("custom.configs.go_conf")


require("custom.neovide")
if vim.g.neovide then
	require("custom.neovide")
end

-- vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"


-- require("custom.configs.snippets")
