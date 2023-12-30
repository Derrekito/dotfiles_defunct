-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    --use "rebelot/kanagawa.nvim"

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    --use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,}
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
            {'saadparwaiz1/cmp_luasnip'}, -- Snippet source for nvim-cmp

            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-cmdline'}
        }
    }

use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
        require('orgmode').setup_ts_grammar()
    end}

    use("folke/zen-mode.nvim")
    use 'ThePrimeagen/vim-be-good'

    use({
        "epwalsh/obsidian.nvim",
        tag = "*",  -- recommended, use latest release instead of latest commit
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        config = function()
            require("obsidian").setup({
                workspaces = {
                    {
                        name = "personal",
                        path = "~/vaults/personal",
                    },
                    {
                        name = "work",
                        path = "~/vaults/work",
                    },
                },

                -- see below for full list of options 👇
            })
        end,
    })
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons" ,
        wants = "nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()

            require("nvim-tree").setup {
                hijack_cursor = true,
                update_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
                view = {
                    width = 40
                }
            }
        end
    }
end)
