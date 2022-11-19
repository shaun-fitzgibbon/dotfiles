local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = true,
  sources = {
    -- code action sources
    null_ls.builtins.code_actions.shellcheck,

    -- diagnostic sources
    null_ls.builtins.diagnostics.eslint,

    -- formatting sources
    null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
    null_ls.builtins.formatting.prettier.with({
      extra_args = { "--single-quote", "false" },
    }),
    -- null_ls.builtins.formatting.latexindent.with({
    --   extra_args = { "-g", "/dev/null" }, -- https://github.com/cmhughes/latexindent.pl/releases/tag/V3.9.3
    -- }),
    
    -- hover sources
    -- null_ls.builtins.hover

    -- completion sources
    -- null_ls.builtins.completion

  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.formatting_sync()
            end,
        })
    end
  end,
})