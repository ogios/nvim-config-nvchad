
local filename = function()
  return vim.api.nvim_buf_get_name(0):match(".*\\(.-)\\.*$")
end

return {
  s("newlogic", {
    t {
      "package "
    },
    i(1, filename()),
    t {
      "",
      "",
      "import (",
      "  \"context\"",
      ")",
      "",
      "type (",
      "  "
    },
    i(2, "sLogic"),
    t " struct{}",
    t {
      "",
      ")",
      "",
      "",
    },
    t {
      "func init() {",
      "  "
    },
    i(3, "service.RegisterXXX"),
    t "(New())",
    t {
      "",
      "}",
      "",
      "",
    },
    t "func New() service.",
    i(4, "IXXX"),
    t " {",
    t {
      "",
      "  "
    },
    t "return &",
    f(function(args) return args[1] end, { ai[2] }),
    t "{}",
    t {
      "",
      "}",
      ""
    },
  }),
}
