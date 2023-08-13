local keymap = vim.keymap
local nvim_keymap = vim.api.nvim_set_keymap

-- esc
keymap.set("i", "jk", "<ESC>")

-- 单行或多行移动
keymap.set('v', "K", ":m '<-2<CR>gv=gv")
keymap.set('v', "J", ":m '>+1<CR>gv=gv")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Go.nvim
keymap.set("n", "<leader>gr", "<CMD>GoRun -F<CR>")


-- Minimap
keymap.set("n", "<leader>mm", "<CMD>MinimapToggle<CR>")


-- lsp defination
-- keymap.set("n", "<leader>ld", "")
-- nvim_keymap("n", "<leader>ld", ":lua vim.lsp.buf.definition()", { desc="lsp definition" })
-- nvim_keymap("n", "<leader>lD", ":lua vim.lsp.buf.declaration()", { desc="lsp declaration" })
-- nvim_keymap("n", "<leader>lK", ":lua vim.lsp.buf.hover()", { desc="lsp hover" })
-- nvim_keymap("n", "<leader>li", ":lua vim.lsp.buf.implementation()", { desc="lsp implementation" })
-- nvim_keymap("n", "<leader>lr", ":lua vim.lsp.buf.references()", { desc="lsp references" })
-- nvim_keymap("n", "<leader>lra", ":lua require('nvchad.renamer').open()", { desc="lsp rename" })



-- vim.cmd("autocmd FileType go nmap <Leader>gr GoRun -F")

-- local term = require("custom.configs.toggleterm_conf")

-- lazygit
-- function _lazygit_toggle()
--     term.lazygit:toggle()
-- end
-- vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
