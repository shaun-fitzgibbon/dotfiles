local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    indicator = {
      style = 'underline'
    },

    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        padding = 1,
        text_align = "left",
        separator = true
      }
    },

    separator_style = "padded_slant",

  }
}
