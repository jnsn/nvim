return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        esbonio = {},
        html = {},
        powershell_es = {
          bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/",
        },
        -- omnisharp = {
        --   cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
        --   enable_import_completion = true,
        -- },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
      },
    },
  },
}
