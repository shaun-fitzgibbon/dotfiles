-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

packer.init({
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
	-- Have packer use a popup window
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- packer can manage itself
	use "wbthomason/packer.nvim"

	use "nvim-lua/plenary.nvim" -- lua functions that many plugins use

	use "Mofiqul/dracula.nvim"
	use { "catppuccin/nvim", as = "catppuccin" } --preferred colorscheme

	use "christoomey/vim-tmux-navigator" -- tmux & split window navigation

	use "szw/vim-maximizer" -- maximizes and restores current window

	-- essential plugins
	use "tpope/vim-surround" -- add, delete, change surroundings (it's awesome)
	use "vim-scripts/ReplaceWithRegister" -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use "numToStr/Comment.nvim"

	-- file explorer
	use "nvim-tree/nvim-tree.lua"

	-- vs-code like icons
	use "nvim-tree/nvim-web-devicons"

	-- statusline
	use "nvim-lualine/lualine.nvim"

	-- fuzzy finding w/ telescope
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } -- dependency for better sorting performance
	use { "nvim-telescope/telescope.nvim", branch = "0.1.x" } -- fuzzy finder

	-- autocompletion
	use "hrsh7th/nvim-cmp" -- completion plugin
	use "hrsh7th/cmp-buffer" -- source for text in buffer
	use "hrsh7th/cmp-path" -- source for file system paths

	-- snippets
	use "L3MON4D3/LuaSnip" -- snippet engine
	use "saadparwaiz1/cmp_luasnip" -- for autocompletion
	use "rafamadriz/friendly-snippets" -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use "williamboman/mason.nvim" -- in charge of managing lsp servers, linters & formatters
	use "williamboman/mason-lspconfig.nvim" -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use "neovim/nvim-lspconfig" -- easily configure language servers
	use "hrsh7th/cmp-nvim-lsp" -- for autocompletion
	use { "glepnir/lspsaga.nvim", branch = "main" } -- enhanced lsp uis
	use "jose-elias-alvarez/typescript.nvim" -- additional functionality for typescript server (e.g. rename file & update imports)
	use "onsails/lspkind.nvim" -- vs-code like icons for autocompletion

	-- formatting & linting
	use "jose-elias-alvarez/null-ls.nvim" -- configure formatters & linters
	use "jayp0521/mason-null-ls.nvim" -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	}
	use { 'JoosepAlviste/nvim-ts-context-commentstring' }

	-- Bufferline Window Tabs
	use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
	use 'moll/vim-bbye'


	-- Trouble pretty
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}

	-- which key
	use "folke/which-key.nvim"

	-- auto closing
	use "windwp/nvim-autopairs" -- autoclose parens, brackets, quotes, etc...
	use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" } -- autoclose tags
	use { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" } -- rainbow tags

	use { "lukas-reineke/indent-blankline.nvim" }

	-- git integration
	use { "lewis6991/gitsigns.nvim" } -- show line modifications on left hand side

	-- Todo Comments
	use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }

	-- The Primeagen : Vim Game
	use { "ThePrimeagen/vim-be-good" } -- Vim be good game



	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
