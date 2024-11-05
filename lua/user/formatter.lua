local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { exe = "black" },
  { name = "beautysh" },
  { name = "cbfmt" },
  { name = "prettier" },
  -- { name = "clang-format" },
  -- { name = "google-java-format" }
})
