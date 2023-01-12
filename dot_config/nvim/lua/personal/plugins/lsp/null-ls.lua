-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local code_actions = null_ls.builtins.code_actions -- code action sources
local completion = null_ls.builtins.completion -- completion sources
local diagnostics = null_ls.builtins.diagnostics -- diagnostic sources
local formatting = null_ls.builtins.formatting -- formatting sources
local hover = null_ls.builtins.hover -- hover sources

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


local sources = {
	-- to disable file types use "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
	-- Code Actions
	code_actions.gitsigns,

	-- Completion
	completion.luasnip,
	completion.spell,
	completion.tags,

	-- Diagnostics
	diagnostics.actionlint,
	diagnostics.eslint_d.with({ -- js/ts linter
		-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
		condition = function(utils)
			return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
		end,
	}),
	diagnostics.jsonlint,
	diagnostics.markdownlint,
	diagnostics.stylelint,
	diagnostics.todo_comments,
	diagnostics.tsc,
	diagnostics.yamllint, -- Yaml Linting

	-- Formating
	formatting.fixjson,
	formatting.prettier, -- js/ts formatter
	formatting.prismaFmt, -- Prisma
	formatting.stylelint,
	formatting.stylua, -- lua formatter
	formatting.yamlfmt, -- Yaml Formating

	-- Hover

}


-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = sources,

	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
