--[[ opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
opt.colorcolumn = "80" -- str:  Show col for max line length
opt.number = true -- bool: Show line numbers
opt.relativenumber = true -- bool: Show relative line numbers
opt.scrolloff = 4 -- int:  Min num lines of context
opt.signcolumn = "yes" -- str:  Show the sign column

-- [[ Filetypes ]]
opt.encoding = "utf8" -- str:  String encoding to use
opt.fileencoding = "utf8" -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON" -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable
opt.background = "dark"

-- [[ Search ]]
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = true -- bool: Highlight search matches

-- [[ Cursor line ]]
opt.cursorline = true
opt.guicursor = ""

-- [[ Whitespace ]]
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 2 -- num:  Size of an indent
opt.softtabstop = 2 -- num:  Number of spaces tabs count for in insert mode
opt.autoindent = true -- bool: Auto indents
opt.tabstop = 2 -- num:  Number of spaces tabs count for
opt.smartindent = true

-- [[ Line wrapping ]]
opt.wrap = false

-- [[ Backspace  ]]
opt.backspace = "indent,eol,start"

-- [[ clipboard ]]
opt.clipboard:append("unnamedplus")

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

opt.iskeyword:append("-")
