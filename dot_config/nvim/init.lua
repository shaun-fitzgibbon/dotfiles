--[[ init.lua ]]


-- CORE
require('personal.plugins-setup')     -- Plugins     
require('personal.core.options')      -- Options     
require('personal.core.keymaps')      -- Key Mappings   
require('personal.core.colorscheme')  -- Key Mappings   
-- require('personal.core.autocmd')   -- Autocommands / Autogroups


-- PLUGINS
require('personal.plugins.comment')
require('personal.plugins.nvim-tree')
require('personal.plugins.lualine')
require('personal.plugins.telescope')
require('personal.plugins.nvim-cmp')
require("personal.plugins.lsp.mason")
require("personal.plugins.lsp.lspsaga")
require("personal.plugins.lsp.lspconfig")
require("personal.plugins.lsp.null-ls")
require("personal.plugins.autopairs")
require("personal.plugins.treesitter")
require("personal.plugins.gitsigns")
