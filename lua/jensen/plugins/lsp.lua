return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { "bashls", "yamlls" },
            handlers = {
                lsp_zero.default_setup,
                require("lspconfig").bashls.setup({}),
                require("lspconfig").yamlls.setup({}),
                require("lspconfig").docker_compose_language_service.setup({}),
                require("lspconfig").dockerls.setup({}),
            },
        })
    end,
}
