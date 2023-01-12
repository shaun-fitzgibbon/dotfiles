-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

local status, context_commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if not status then
	return
end

-- enable comment
comment.setup({
	pre_hook = context_commentstring.create_pre_hook()
})
