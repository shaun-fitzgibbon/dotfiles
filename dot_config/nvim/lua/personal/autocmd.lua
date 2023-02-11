local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup


-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = augroup('Packer', { clear = true })
autocmd('BufWritePost', {
    command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = highlight_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
