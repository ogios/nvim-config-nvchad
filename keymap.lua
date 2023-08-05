local keymap = vim.keymap

-- esc
keymap.set("i", "jk", "<ESC>")

-- 单行或多行移动
keymap.set('v', "J", ":m '<-2<CR>gv=gv")
keymap.set('v', "K", ":m '>+1<CR>gv=gv")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")
