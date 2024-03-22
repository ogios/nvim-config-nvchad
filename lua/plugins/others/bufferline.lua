return {
  "akinsho/bufferline.nvim",
  lazy = true,
  dependencies = {
    {
      "tiagovla/scope.nvim",
      after = {
        "nvim-telescope/telescope.nvim",
      },
      config = function()
        -- init.lua
        -- vim.opt.sessionoptions = { -- required
        --   "buffers",
        --   "tabpages",
        --   "globals",
        -- }
        require("scope").setup({})
        require("telescope").load_extension("scope")
      end,
    },
  },
  opts = function(_, opts)
    opts.options = vim.tbl_extend("keep", opts.options, {
      numbers = "ordinal",
    })
    opts.options.offsets = vim.list_extend(opts.options.offsets, {
      {
        filetype = "dbui",
        text = "DATABASE",
        highlight = "Directory",
        text_align = "center",
      },
      {
        filetype = "DiffViewFiles",
        text = "DIFFVIEW",
        highlight = "Directory",
        text_align = "center",
      },
      {
        filetype = "Mundo",
        text = "UNDOTREE",
        highlight = "Directory",
        text_align = "center",
      },
      {
        filetype = "Outline",
        text = "OUTLINE",
        highlight = "Directory",
        text_align = "center",
      },
    })
    return opts
  end,
  -- opts = {
  --   options = {
  --     numbers = "ordinal",
  --     offsets = {
  --       {
  --         filetype = "dbui",
  --         text = "DATABASE",
  --         highlight = "Directory",
  --         text_align = "center",
  --       },
  --       {
  --         filetype = "DiffViewFiles",
  --         text = "DIFFVIEW",
  --         highlight = "Directory",
  --         text_align = "center",
  --       },
  --       {
  --         filetype = "Mundo",
  --         text = "UNDOTREE",
  --         highlight = "Directory",
  --         text_align = "center",
  --       },
  --       -- {
  --       --   filetype = "NvimTree",
  --       --   text = "EXPLORER",
  --       --   highlight = "Directory",
  --       --   text_align = "center",
  --       -- },
  --       {
  --         filetype = "Outline",
  --         text = "OUTLINE",
  --         highlight = "Directory",
  --         text_align = "center",
  --       },
  --     },
  --     custom_filter = function(buf_number)
  --       require("lazyvim.util").info(tostring(buf_number))
  --       local buf = vim.bo[buf_number]
  --       require("lazyvim.util").info(buf.filetype)
  --       require("lazyvim.util").info(buf.buftype)
  --       return vim.bo[buf_number].filetype ~= "fugitive"
  --         and vim.bo[buf_number].filetype ~= "NeogitStatus"
  --         and vim.bo[buf_number].buftype ~= "terminal"
  --     end,
  --   },
  -- },
}
