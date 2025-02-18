vim.lsp.log_levels = 0

require("lvim.lsp.manager").setup("angularls")
require("lvim.lsp.manager").setup("texlab")
require("lvim.lsp.manager").setup("csharp_ls")
require("lvim.lsp.manager").setup("azure_pipelines_ls")
require("lvim.lsp.manager").setup("lua_ls")
require("lvim.lsp.manager").setup("tsserver")

-- TODO: overwriting these deletes lvim default config
require("mason-lspconfig").setup_handlers({
  ["pyright"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup({
      autoImportCompletion = true,
      typeCheckingMode = "strict",
      autoSearchPaths = true,
      diagnosticMode = "openFilesOnly",
      useLibraryCodeForTypes = true,
    })
  end,
  ["cmake"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.cmake.setup({})
  end,
})
