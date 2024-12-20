return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "julials", "texlab", "r_language_server", "marksman" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local util = require("lspconfig.util")

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.clangd.setup({
                capabilities = capabilities
            })
            lspconfig.julials.setup({
                capabilities = capabilities
            })
            lspconfig.texlab.setup({
                capabilities = capabilities
            })
            lspconfig.r_language_server.setup({
                capabilities = capabilities
            })
            lspconfig.marksman.setup({
                capabilities = capabilities,
                filetypes = {"markdown", "quarto"},
                root_dir = util.root_pattern('.git', '.marksman.toml', '_quarto.yml')
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
