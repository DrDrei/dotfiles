return {
	"kyazdani42/nvim-tree.lua",
	opts = {
		respect_buf_cwd = true,
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
		update_focused_file = {
			enable = false,
			update_cwd = true,
		},
		renderer = {
			icons = {
				glyphs = {
					default = "",
					symlink = "",
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						deleted = "",
						untracked = "U",
						ignored = "◌",
					},
					folder = {
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
					},
				},
			},
		},
	},
}
