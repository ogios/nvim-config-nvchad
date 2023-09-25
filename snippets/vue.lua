local function reused_func(_, _, user_arg1)
  return user_arg1
end
return {
  -- s("trig2", {
  --   f(reused_func, {}, { user_args = { "text " } }),
  --   f(reused_func, {}, { user_args = { "different text" } }),
  -- }),
  s("VUENEW", {
    t {
      "<template>",
      "",
      "",
      "</template>",
      "",
      "",
      '<script setup lang="ts">',
      "",
      "",
      "</script>",
      "",
      "",
      "<style lang=\"scss\" scoped>",
      "",
      "",
      "</style>"
    },
  }),
  s("space", {
    t "&nbsp;"
  })
}
