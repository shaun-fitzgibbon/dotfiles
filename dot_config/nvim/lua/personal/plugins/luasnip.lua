-- import nvim-tree plugin safely
local status_ok, vscode_snippets = pcall(require, "luasnip.loaders.from_vscode")
if not status_ok then
  return
end

vscode_snippets.lazy_load()
