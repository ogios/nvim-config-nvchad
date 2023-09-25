local keymap = vim.keymap
-- local nvim_keymap = vim.api.nvim_set_keymap

-- esc
keymap.set("i", "jk", "<ESC>")

-- 单行或多行移动
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

--[[ -- Go.nvim
keymap.set("n", "<leader>gr", "<CMD>GoRun -F<CR>") ]]

--[[ -- Minimap
keymap.set("n", "<leader>mm", "<CMD>MinimapToggle<CR>") ]]


