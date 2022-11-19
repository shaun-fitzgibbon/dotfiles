-- import indent_blankline safely
local status_ok, indentblankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end


vim.opt.list = true

indentblankline.setup({
  enabled = true,
  colored_indent_levels = false,
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = true,
})
