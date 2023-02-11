local globals = {
    -- See `:help mapleader`
    --  NOTE: Mapleader must happen before plugins are required (otherwise wrong leader will be used)
    mapleader = " ",
    maplocalleader = ' ',
    glow_binary_path = vim.env.HOME .. "/bin",
    glow_use_pager = true,
    glow_border = "shadow",
    -- Netrw
    netrw_browse_split = 3,
    netrw_banner = 1,
    netrw_winsize = 25,
}

for k, v in pairs(globals) do
    vim.g[k] = v
end
