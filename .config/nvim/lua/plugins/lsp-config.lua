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
    {
        {'hrsh7th/cmp-path'},
    },
    {
        {'hrsh7th/cmp-cmdline'},
    },
    {
        "hrsh7th/cmp-buffer",
        lazy = true,  -- Set to lazy load
        after = "nvim-cmp",  -- Load after nvim-cmp
        config = function()
        end,
    },
    -- Configuration for cmp-cmdline (lazy loading)
    {
        "hrsh7th/cmp-cmdline",
        lazy = true,  -- Lazy load cmp-cmdline
        after = "nvim-cmp",  -- Ensure it loads after nvim-cmp
        config = function()
            local cmp = require('cmp')
            -- Command line mode setup for ':'
            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'cmdline' }
                })
            })

            -- Optionally, for search mode '/'
            cmp.setup.cmdline('/', {
                sources = cmp.config.sources({
                    { name = 'buffer' }
                })
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                window = {
                    documentation = cmp.config.window.bordered(),
                    completion = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },

    -- Configuration for cmp-nvim-lsp
    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = false,
        config = function()
            -- Update capabilities for LSP servers
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- Configure each LSP server
            local lspconfig = require("lspconfig")

            lspconfig.clangd.setup({
                capabilities = capabilities,
                -- Additional configuration for clangd
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                -- Additional configuration for rust_analyzer
            })

            lspconfig.bashls.setup({
                capabilities = capabilities,
                -- Additional configuration for bashls
            })

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                -- Additional configuration for lua_ls
            })

            lspconfig.marksman.setup({
                capabilities = capabilities,
                -- Additional configuration for marksman
            })

            lspconfig.pylsp.setup({
                capabilities = capabilities,
                -- Additional configuration for pylsp
            })

            lspconfig.jsonls.setup({
                capabilities = capabilities,
                -- Additional configuration for jsonls
            })

            lspconfig.texlab.setup({
                capabilities = capabilities,
                -- Additional configuration for texlab
            })
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
