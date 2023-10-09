
local setup = function()

  -- setup go.nvim
  require("go").setup {
    -- NOTE: all LSP and formatting related options are disabeld.
    -- NOTE: LSP is handled by lsp.lua and formatting is handled by null-ls.lua
    -- NOTE: via `lsp_on_attach` the custom callback used by all other LSPs is called
    go = "go", -- go command, can be go[default] or go1.18beta1
    -- goimport = "gopls", -- goimport command, can be gopls[default] or goimport
    goimport = "goimports", -- goimport command, can be gopls[default] or goimport
    fillstruct = "gopls", -- can be nil (use fillstruct, slower) and gopls
    gofmt = "gofumpt", -- gofmt cmd,
    max_line_len = 128, -- max line length in golines format, Target maximum line length for golines
    tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
    tag_options = "json=omitempty", -- sets options sent to gomodifytags, i.e., json=omitempty
    gotests_template = "", -- sets gotests -template parameter (check gotests for details)
    gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
    comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ       
    icons = { breakpoint = "🧘", currentpos = "🏃" }, -- setup to `false` to disable icons setup
    -- icons = false,
    -- verbose = true, -- output loginf in messages
    -- log_path = "/home/ogios/log/gonvim.log",
    -- lsp_cfg = {
    --         capabilities = capabilities,
    -- }, -- true: use non-default gopls setup specified in go/lsp.lua
    lsp_cfg = true,
    -- false: do nothing
    -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
    -- lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
    lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
    -- lsp_on_attach = on_attach, -- nil: use on_attach function defined in go/lsp.lua,
    lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
    -- when lsp_cfg is true
    -- if lsp_on_attach is a function: use this function as on_attach function for gopls
    lsp_codelens = true, -- set to false to disable codelens, true by default
    lsp_keymaps = false, -- set to false to disable gopls/lsp keymap
    diagnostic = {
      hdlr = true,
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = true,
    },
    -- lsp_diag_virtual_text = { space = 0, prefix = "" },
    lsp_document_formatting = false, -- true: use gopls to format, false: use other formatter tool
    lsp_inlay_hints = {
      enable = true,
      -- Only show inlay hints for the current line
      only_current_line = false,
      -- Event which triggers a refersh of the inlay hints.
      -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
      -- not that this may cause higher CPU usage.
      -- This option is only respected when only_current_line and
      -- autoSetHints both are true.
      only_current_line_autocmd = "CursorHold",
      -- whether to show variable name before type hints with the inlay hints or not
      -- default: false
      show_variable_name = true,
      -- prefix for parameter hints
      parameter_hints_prefix = "󰊕 ",
      -- parameter_hints_prefix = " ",
      show_parameter_hints = true,
      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=> ",
      -- whether to align to the lenght of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 6,
      -- The color of the hints
      highlight = "Comment",
    },
    gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
    gopls_remote_auto = true, -- add -remote=auto to gopls
    gocoverage_sign = "█",
    sign_priority = 5, -- change to a higher number to override other signs
    -- dap_debug = false, -- set to false to disable dap
    -- dap_debug_keymap = false, -- true: use keymap for debugger defined in go/dap.lua
    -- false: do not use keymap in go/dap.lua.  you must define your own.
    -- dap_debug_gui = false, -- set to true to enable dap gui, highly recommended
    -- dap_debug_vt = false, -- set to true to enable dap virtual text
    -- build_tags = "", --textobjects = true, -- enable default text jobects through treesittter-text-objects
    test_runner = "dlv", -- richgo, go test, richgo, dlv, ginkgo
    run_in_floaterm = true, -- set to true to run in float window. set default build tags
    -- float term recommend if you use richgo/ginkgo with terminal color
    -- trouble = true, -- true: use trouble to open quickfix
    floaterm = { -- position
      posititon = "top", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
      -- width = 0.45, -- width of float window if not auto
      height = 0.6, -- height of float window if not auto
    },
  }

  -- auto format
  local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      require("go.format").goimport()
    end,
    group = format_sync_grp,
  })
end

local function GoRunWithArgs()
  local args = require("neoconf").get("go.run.args", {})
  local cmd = "GoRun . -F -a "
  for key, val in pairs(args) do
    cmd = cmd .. key .. "\\ " .. val .. "\\ "
  end
  vim.notify(cmd)
  vim.cmd(cmd)
end

return {
  "ray-x/go.nvim",
  event = { "BufEnter *.go" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  keys = {
    {
      "<leader>gr",
      GoRunWithArgs,
      desc = "Run Go Project",
    },
  },
  config = function()
    setup()
  end,
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
}
