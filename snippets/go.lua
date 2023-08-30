
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
    t "s",
    i (2, "Logic"),
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
    t "service.Register",
    f(function(args) return args[1] end, { ai[2] }),
    t "(New())",
    t {
      "",
      "}",
      "",
      "",
    },
    t "func New() service.I",
    f(function(args) return args[1] end, { ai[2] }),
    t " {",
    t {
      "",
      "  "
    },
    t "return &s",
    f(function(args) return args[1] end, { ai[2] }),
    t "{}",
    t {
      "",
      "}",
      ""
    },
    t "func (s *s",
    f(function (args) return args[1] end, { ai[2] }),
    t {
      ") Example(ctx context.Context) (err error) {",
      "  return nil",
      "}"
    },
  }),
}
