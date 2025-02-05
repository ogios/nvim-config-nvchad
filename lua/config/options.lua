-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.wrap = true
vim.g.snacks_animate = false
vim.g.lazyvim_blink_main = true
-- vim.o.guifont = "JetBrainsMono Nerd Font Mono:h16"
vim.g.mkdp_auto_close = 0
vim.g.mkdp_combine_preview = 1
require("util.neovide")

-- vim.g.lazyvim_python_lsp = "pylyzer"
