-- [[ Setting options ]]
-- See `:help vim.o`
local options = {
    guicursor = "",
    nu = true,
    relativenumber = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    wrap = false,
    swapfile = false,
    backup = false,
    writebackup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    hlsearch = false,
    incsearch = true,
    termguicolors = true,
    scrolloff = 8,
    signcolumn = "yes",
    updatetime = 50,
    colorcolumn = "80",
    ma = true,
    mouse = "a",
    cursorline = false,
    autoread = true,
    foldlevelstart = 99,
    clipboard = "unnamedplus",
    showmode = false,
    breakindent = true,
    ignorecase = true,
    smartcase = true,
    completeopt = 'menuone,noselect',
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
