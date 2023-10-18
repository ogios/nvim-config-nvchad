-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.wrap = true
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h16"
vim.g.neovide_underline_automatic_scaling = true

vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_scroll_animation_length = 0.15
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_trail_size = 0.15
vim.g.neovide_hide_mouse_when_typing = false

-- vim.g.neovide_fullscreen = true
-- vim.g.neovide_profiler = true
vim.g.neovide_cursor_vfx_mode = "sonicboom"
vim.g.neovide_refresh_rate = 144
