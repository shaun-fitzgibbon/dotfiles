-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end


-- configure treesitter
treesitter.setup({
	context_commentstring = {
		enable = true
	},
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- enable Rainbow tags
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},

	-- ensure these language parsers are installed
	ensure_installed = {
		"astro",
		"bash",
		"comment",
		"cmake",
		"css",
		"dockerfile",
		"gitattributes",
		"gitignore",
		"graphql",
		"hcl",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"latex",
		"lua",
		"markdown",
		"prisma",
		"scss",
		"svelte",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},

	-- auto install above language parsers
	auto_install = true,
})
