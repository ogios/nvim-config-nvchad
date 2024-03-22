-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local D = {
  n = {
    "<leader>/",
    "<M-\\>",
    "<c-/>",
  },

  t = {
    "<M-\\>",
    "<C-/>",
  },
}

-- delete keymap
for mode, modeval in pairs(D) do
  for _, val in pairs(modeval) do
    pcall(function()
      vim.keymap.del(mode, val, { clear = true })
    end)
  end
end

local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
local M = {
  x = {
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text" },
  },

  v = {
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text" },
  },

  t = {
    ["<M-\\>"] = { "<cmd>close<cr>", "Close terminal (root dir)" },
  },

  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left", true },
    ["<C-l>"] = { "<Right>", "Move right", true },
    ["<C-j>"] = { "<Down>", "Move down", true },
    ["<C-k>"] = { "<Up>", "Move up", true },
    ["jk"] = { "<ESC>", "Exit insert mode" },
  },

  n = {
    ["<M-\\>"] = { lazyterm, "Terminal (root dir)", true },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep", true },
    ["<Esc>"] = { ":noh <CR>", "Clear highlights" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

    -- Format
    ["<leader>fm"] = {
      function()
        require("lazyvim.util").format({ force = true })
      end,
      "LSP formatting",
    },

    -- command
    ["<leader>md"] = {
      function()
        require("telescope.builtin").commands()
      end,
      "telescope builtin command",
    },

    -- lsp
    ["<leader>ld"] = {
      -- function()
      --   require("telescope.builtin").lsp_definitions({ reuse_win = true })
      -- end,
      "<CMD>Glance definitions<CR>",
      "Goto Definition",
      true,
    },
    ["<leader>lr"] = {
      -- "<cmd>Telescope lsp_references<cr>",
      "<CMD>Glance references<CR>",
      "References",
    },
    ["<leader>lY"] = {
      -- function()
      --   require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
      -- end,
      "<CMD>Glance type_definitions<CR>",
      "Goto T[y]pe Definition",
      true,
    },
    ["<leader>lI"] = {
      -- function()
      --   require("telescope.builtin").lsp_implementations({ reuse_win = true })
      -- end,
      "<CMD>Glance implementations<CR>",
      "Goto Implementation",
      true,
    },

    ["<leader>lD"] = { vim.lsp.buf.declaration, "Goto Declaration", true },
    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float({ border = "rounded" })
      end,
      "Float diagnostic",
      true,
    },
    ["<leader>lra"] = {
      vim.lsp.buf.rename,
      "LSP rename",
      true,
    },
    ["<A-CR>"] = {
      "<CMD>CodeActionMenu<CR>",
      "Code action menu",
      true,
    },

    ["qw"] = { "viw", "select word in visual mode" },
    ["<leader>ms"] = { "<CMD>Outline<CR>", "open up code structure map", true },
    ["<C-A-Up>"] = { "<CMD>resize +5<CR>", "increase window height", true },
    ["<C-A-Down>"] = { "<CMD>resize -5<CR>", "increase window height", true },
    ["<C-A-Left>"] = { "<CMD>vertical resize -5<CR>", "increase window height", true },
    ["<C-A-Right>"] = { "<CMD>vertical resize +5<CR>", "increase window height", true },

    -- buffer
    ["<leader>dq"] = {
      function()
        local bd = require("mini.bufremove").delete
        if vim.bo.modified then
          local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
          if choice == 1 then -- Yes
            vim.cmd.write()
            bd(0)
          elseif choice == 2 then -- No
            bd(0, true)
          end
        else
          bd(0)
        end
      end,
      "Delete Buffer",
      true,
    },
    ["<leader>Dq"] = {
      function()
        require("mini.bufremove").delete(0, true)
      end,
      "Delete Buffer (Force)",
      true,
    },
    ["<Tab>"] = {
      "<CMD>bnext<CR>",
      "Next tab",
      true,
    },
    ["<S-Tab>"] = {
      "<CMD>bprevious<CR>",
      "Previous tab",
      true,
    },
  },
}

-- set keymap
for mode, modeval in pairs(M) do
  for key, val in pairs(modeval) do
    if vim.g.vscode then
      local ok, notvscode = pcall(function(_val)
        return _val[3]
      end, val)
      if ok and notvscode then
        goto continue
      end
    end
    vim.keymap.set(mode, key, val[1], { desc = val[2], remap = true })
    ::continue::
  end
end
