return {
  enabled = false,

  {
    "hrsh7th/nvim-cmp",
    cond = not vim.g.vscode,
    dependencies = {
      { "windwp/nvim-autopairs", opts = {} },
    },
    opts = function()
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- Insert parentheses after selecting method/function
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  -- hypr
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "hypr")
    end,
  },

  -- rust
  {
    "hrsh7th/nvim-cmp",
    keys = {
      -- See opts.combo from nvim-cmp-lsp-rs below
      {
        "<leader>bc",
        "<cmd>lua require'cmp_lsp_rs'.combo()<cr>",
        desc = "(nvim-cmp) switch comparators",
      },
    },
    dependencies = {
      {
        "zjp-CN/nvim-cmp-lsp-rs",
        ---@type cmp_lsp_rs.Opts
        opts = {
          -- Filter out import items starting with one of these prefixes.
          -- A prefix can be crate name, module name or anything an import
          -- path starts with, no matter it's complete or incomplete.
          -- Only literals are recognized: no regex matching.
          unwanted_prefix = { "color", "ratatui::style::Styled" },
          -- make these kinds prior to others
          -- e.g. make Module kind first, and then Function second,
          --      the rest ordering is merged from a default kind list
          kind = function(k)
            -- The argument in callback is type-aware with opts annotated,
            -- so you can type the CompletionKind easily.
            return { k.Module, k.Function }
          end,
          -- Override the default comparator list provided by this plugin.
          -- Mainly used with key binding to switch between these Comparators.
          combo = {
            -- The key is the name for combination of comparators and used
            -- in notification in swiching.
            -- The value is a list of comparators functions or a function
            -- to generate the list.
            alphabetic_label_but_underscore_last = function()
              local comparators = require("cmp_lsp_rs").comparators
              return { comparators.sort_by_label_but_underscore_last }
            end,
            recentlyUsed_sortText = function()
              local compare = require("cmp").config.compare
              local comparators = require("cmp_lsp_rs").comparators
              -- Mix cmp sorting function with cmp_lsp_rs.
              return {
                compare.recently_used,
                compare.sort_text,
                comparators.sort_by_label_but_underscore_last,
              }
            end,
          },
        },
      },
    },
    --@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp_lsp_rs = require("cmp_lsp_rs")
      local comparators = cmp_lsp_rs.comparators
      local compare = require("cmp").config.compare

      opts.sorting.comparators = {
        compare.exact,
        compare.score,
        -- comparators.inherent_import_inscope,
        comparators.inscope_inherent_import,
        comparators.sort_by_label_but_underscore_last,
      }

      for _, source in ipairs(opts.sources) do
        cmp_lsp_rs.filter_out.entry_filter(source)
      end

      return opts
    end,
  },
}
