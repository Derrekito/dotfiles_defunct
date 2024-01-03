return {
    -- Mason configuration for LSP server management
    {
        "williamboman/mason.nvim",
        lazy = false,  -- Adjust this based on your preference
    -- Configuration for nvim-cmp
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    'clangd', 'rust_analyzer', 'bashls', 'lua_ls', 'marksman', 'pylsp', 'jsonls', 'texlab'
                },
                automatic_installation = true,
            })
        end,
    },

    -- LuaSnip configuration
    {
        "L3MON4D3/LuaSnip",
        lazy = false,
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    -- nvim-lspconfig for setting up LSP servers
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            -- Key mappings for LSP functionalities
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
