-- function _G.set_terminal_keymaps()
-- 	local opts = { noremap = true }
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
-- end
--
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "double",
	},
})

function Lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua Lazygit_toggle()<CR>", { noremap = true, silent = true })

return {
	"akinsho/toggleterm.nvim",
	config = true,
	opts = {
		open_mapping = [[<c-\>]],
		direction = "float",
		hide_numbers = false,
		float_opts = {
			border = "double",
		},
	},
}
