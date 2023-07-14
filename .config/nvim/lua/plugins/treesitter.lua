return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	cmd = { "TSUpdateSync" },
	opts = {
		sync_install = false,
		ignore_install = { "" },
		ensure_installed = {
			"bash",
			"c",
			"css",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"tsx",
			"prisma",
			"typescript",
			"javascript",
			"tsx",
			"yaml",
		},
		highlight = { enable = true },
		indent = { enable = true },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	},
	config = function(_, opts)
		local added = {}
		opts.ensure_installed = vim.tbl_filter(function(lang)
			if added[lang] then
				return false
			end
			added[lang] = true
			return true
		end, opts.ensure_installed)

		require("nvim-treesitter.configs").setup(opts)
	end,
}
