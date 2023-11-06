return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "yamlls",
        "docker_compose_language_service",
        "dockerls",
        "powershell_es",
        "lua_ls",
      },
      handlers = {
        lsp_zero.default_setup,
        require("lspconfig").bashls.setup({}),
        require("lspconfig").yamlls.setup({}),
        require("lspconfig").docker_compose_language_service.setup({}),
        require("lspconfig").dockerls.setup({}),
        require("lspconfig").powershell_es.setup({}),
        require("lspconfig").lua_ls.setup({}),
      },
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettierd", -- prettier formatter
        "stylua", -- lua formatter
      },
    })

    local cmp = require("cmp")
    local cmp_action = lsp_zero.cmp_action()

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        -- 'TAB' key to confirm selection
        ["<TAB>"] = cmp.mapping.confirm({ select = false }),
        -- 'CTRL+SPACE' to trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),
        -- Navigate between snippet placeholder
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        -- toggle completion
        ["<M-u>"] = cmp_action.toggle_completion(),
      }),
    })
  end,
}
