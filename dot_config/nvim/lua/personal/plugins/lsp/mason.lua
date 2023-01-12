-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"astro", -- Astro
		"bashls", -- Bash
		"cssls", -- Css
		"cssmodules_ls", -- Css Modules
		"eslint", -- Javascript
		"graphql", -- GraphQL
		"html", -- HTML
		"jsonls", -- JSON
		"prismals", -- PRISMA
		"stylelint_lsp",
		"sumneko_lua", -- Lua
		"tailwindcss",
		"taplo", -- TOML
		"tsserver",
		"yamlls", -- YAML
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		-- Code Actions
		"gitsigns",

		-- Completion
		"luasnip",
		"spell",
		"tags",

		-- Diagnostics
		"actionlint", -- Github Actions Linter
		"eslint_d", -- ts/js linter
		"jsonlint", -- JSON linter
		"markdownlint", -- Markdown linter
		"stylelint",
		"todo_comments",
		"tsc",
		"yamllint", -- Yaml Linting

		-- Formating
		"fixjson",
		"prettier", -- ts/js formatter
		"prismaFmt", -- Prisma Formatter
		"stylelint",
		"stylua", -- lua formatter
		"yamlfmt", -- Yaml formatter

		-- Hover
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
