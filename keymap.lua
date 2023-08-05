local keymap = vim.keymap

-- esc
keymap.set("i", "jk", "<ESC>")

-- 单行或多行移动
keymap.set('v', "K", ":m '<-2<CR>gv=gv")
keymap.set('v', "J", ":m '>+1<CR>gv=gv")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")


local term = require("custom.configs.toggleterm")

-- lazygit
function _lazygit_toggle()
    term.lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
