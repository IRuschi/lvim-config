local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { exe = "black" },
  { name = "beautysh" },
  { name = "cbfmt" },
  { name = "prettier" },
  { name = "csharpier", filetypes = { "cs" } },
  -- { name = "google-java-format" }
})

lvim.format_on_save.enabled = true
