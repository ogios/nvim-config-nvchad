-- return {
--   "norcalli/nvim-colorizer.lua",
--   lazy = true,
--   config = function()
--     require("colorizer").setup()
--   end,
-- }
return {
  "NvChad/nvim-colorizer.lua",
  opt = true,
  config = function()
    require("colorizer").setup({
      filetypes = {
        "*",
        css = { css = true, css_fn = true },
        html = { names = false },
      },
      user_default_options = {
        mode = "virtualtext",
        tailwind = "both",
      },
    })
  end,
}
