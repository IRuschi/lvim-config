vim.lsp.log_levels = 0
lvim.builtin.mason.on_config_done = function()
  require("mason-lspconfig").setup {
    automatic_installation = true,
    -- TODO: add all
    ensure_installed = {
      "buf",
      "buildifier",
      "checkstyle",
      "cmake",
      -- "flake8",
      "jsonlint",
      "shellcheck",
      "lua_ls",
      "rust_analyzer",
      "clangd",
      "texlab",
      "csharp_ls",
      "azure_pipelines_ls",
    },
  }
end

require("lvim.lsp.manager").setup("angularls")
require("lvim.lsp.manager").setup("texlab")
require("lvim.lsp.manager").setup("csharp_ls")
require("lvim.lsp.manager").setup("azure_pipelines_ls")

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
  ["clangd"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup({})
  end,
})
