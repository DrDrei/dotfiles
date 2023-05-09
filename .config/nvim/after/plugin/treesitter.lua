local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	sync_install = false,
	ignore_install = { "" },
	ensure_installed = {
		"bash",
		"css",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"tsx",
		"prisma",
		"typescript",
		"yaml",
	},
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
