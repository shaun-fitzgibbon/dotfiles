-- Install packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
        -- Package manager
        use 'wbthomason/packer.nvim'

        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' }, -- Required
                { 'williamboman/mason.nvim' }, -- Optional
                { 'williamboman/mason-lspconfig.nvim' }, -- Optional

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' }, -- Required
                { 'hrsh7th/cmp-nvim-lsp' }, -- Required
                { 'hrsh7th/cmp-buffer' }, -- Optional
                { 'hrsh7th/cmp-path' }, -- Optional
                { 'saadparwaiz1/cmp_luasnip' }, -- Optional
                { 'hrsh7th/cmp-nvim-lua' }, -- Optional

                -- Snippets
                { 'L3MON4D3/LuaSnip' }, -- Required
                { 'rafamadriz/friendly-snippets' }, -- Optional
            }
        }

        use {
            'rose-pine/neovim',
            as = 'rose-pine',
            config = function()
                require("rose-pine").setup()
                vim.cmd('colorscheme rose-pine')
            end
        }

        -- Git related plugins
        use 'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'
        use 'lewis6991/gitsigns.nvim'

        use 'nvim-lualine/lualine.nvim' -- Fancier statusline
        use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
        use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
        use 'tpope/vim-sleuth'

        use { -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            run = function()
                pcall(require('nvim-treesitter.install').update { with_sync = true })
            end,
        }

        use { -- Additional text objects via treesitter
            'nvim-treesitter/nvim-treesitter-textobjects',
            after = 'nvim-treesitter',
        }

        -- Fuzzy Finder (files, lsp, etc)
        use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

        -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
            -- When we are bootstrapping a configuration, it doesn't
            -- make sense to execute the rest of the init.lua.
            --
            -- You'll need to restart nvim, and then it will work.
            print '=================================='
            print '    Plugins are being installed'
            print '    Wait until Packer completes,'
            print '       then restart nvim'
            print '=================================='
        end
    end)
