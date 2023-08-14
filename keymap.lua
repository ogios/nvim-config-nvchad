local keymap = vim.keymap
-- local nvim_keymap = vim.api.nvim_set_keymap

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


local opts = {}
vim.api.nvim_set_keymap("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-b>", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>rs", "<CMD>SearchReplaceSingleBufferSelections<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ro", "<CMD>SearchReplaceSingleBufferOpen<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rw", "<CMD>SearchReplaceSingleBufferCWord<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rW", "<CMD>SearchReplaceSingleBufferCWORD<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>re", "<CMD>SearchReplaceSingleBufferCExpr<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rf", "<CMD>SearchReplaceSingleBufferCFile<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>rbs", "<CMD>SearchReplaceMultiBufferSelections<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbo", "<CMD>SearchReplaceMultiBufferOpen<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbw", "<CMD>SearchReplaceMultiBufferCWord<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbW", "<CMD>SearchReplaceMultiBufferCWORD<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbe", "<CMD>SearchReplaceMultiBufferCExpr<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbf", "<CMD>SearchReplaceMultiBufferCFile<CR>", opts)

-- show the effects of a search / replace in a live preview window
vim.o.inccommand = "split"


-- vim.cmd("autocmd FileType go nmap <Leader>gr GoRun -F")

-- local term = require("custom.configs.toggleterm_conf")

-- lazygit
-- function _lazygit_toggle()
--     term.lazygit:toggle()
-- end
-- vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
