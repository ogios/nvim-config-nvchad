vim.o.guifont = "JetBrainsMonoNL Nerd Font Mono"
-- vim.g.guifont = "JetBrainsMonoNL Nerd Font Mono"
vim.g.GuiFont = "JetBrainsMonoNL Nerd Font Mono:h14"
require("custom.vimopt")
require("custom.keymap")
-- require("custom.configs.go_conf")


if vim.g.neovide then
	require("custom.neovide")
end

-- vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"

if vim.g.GuiLoaded then
  vim.api.nvim_call_function("GuiWindowFrameless", {"1"})
  vim.cmd("GuiWindowOpacity 0.9")
end

-- require("custom.configs.snippets")
