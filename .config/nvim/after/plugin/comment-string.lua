local configs_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_ok then
	return
end

local comment_ok, comment = pcall(require, "Comment")
if not comment_ok then
	return
end

configs.setup({
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

comment.setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
