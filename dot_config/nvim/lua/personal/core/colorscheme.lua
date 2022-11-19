-- import nvim-autopairs safely
local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end


catppuccin.setup {
	integrations = {
		cmp = true,
		gitsigns = true,
		lsp_saga = true,
		mason = true,
		mini = false,
		notify = false,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		which_key = true,
	},
}


-- set colorscheme to dracula with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
