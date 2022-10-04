local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>q", ":bd<cr>", term_opts)
keymap("n", "<leader>;", "<C-w><C-w>", term_opts)
keymap("n", "<leader>l", ":nohl<cr>", term_opts)
keymap("n", "<leader>fo", ":w | !open %<cr>", opts)
keymap("n", "<leader>fm", ":lua vim.lsp.buf.format()<cr>", opts)
keymap("n", "<leader>so", ":so %<cr>", opts)
keymap("n", "<leader>sf", ":w<cr>", opts)
keymap("n", "U", "<C-r>", opts)

keymap("n", "<leader>Q", ":BufferLineCloseLeft<cr>:BufferLineCloseRight<cr>", term_opts)

-- Recenter when scrolling
keymap("n", "<C-u>", "<C-u>zz", term_opts)
keymap("n", "<C-d>", "<C-d>zz", term_opts)
keymap("n", "<C-f>", "za", term_opts)
keymap("n", "#", "#zz", term_opts)
keymap("n", "*", "*zz", term_opts)
keymap("n", "Y", "y$", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Navigation
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>ft", ":NvimTreeFindFile<cr>", opts)

-- Hop Support
keymap("n", "<leader>fw", ":HopWord<cr>", opts)
keymap("n", "<leader>fc", ":HopChar2<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>fc", ":Telescope git_commits<cr>", opts)
keymap("n", "<leader>fu", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fq", ":Telescope quickfixhistory<cr>", opts)
keymap("n", "<leader>fj", ":Telescope grep_string<cr>", opts)
keymap("n", "<leader>fp", ":Telescope projects<cr>", opts)
keymap("n", "<leader>fb", ":Telescope git_branches<cr>", opts)
keymap("n", "<leader>fk", ":Telescope bookmarks<cr>", opts)
keymap("n", "<leader>gt", ":Telescope git_stash<cr>", opts)
keymap("n", "<leader>fy", ':lua require("telescope.builtin").grep_string({search = vim.fn.getreg()})<cr><esc>', opts)

-- Quickfix/Location Lists
keymap("n", "<C-q>", ":copen<cr>zz", opts)
keymap("n", "<C-p>", ":cp<cr>zz", opts)
keymap("n", "<C-n>", ":cnext<cr>zz", opts)
keymap("n", "<leader>cc", ":cclose<cr>zz", opts)

-- Git things
keymap("n", "<leader>gs", ":Git<CR>:resize 16<cr>", opts)
keymap("n", "<leader>gf", ":Git fetch --prune<cr>", opts)
keymap("n", "<leader>go", ":Git commit --no-verify<cr>", opts)
keymap("n", "<leader>gr", ":Git rebase -i HEAD~", opts)
keymap("n", "<leader>gl", ":Git pull<cr>", opts)
keymap("n", "<leader>gp", ":Git push --no-verify<cr>", opts)
keymap("n", "<leader>gP", ":Git push -f --no-verify<cr>", opts)
keymap("n", "<leader>gb", ":Git blame<cr>", opts)
keymap("n", "<leader>gw", ":Gwrite<cr>", opts)

-- Repeat macro
keymap("n", ",,", "@@", opts)

-- User Commands
vim.api.nvim_create_user_command("TestFile", function()
	local filePath = vim.fn.expand("%:p")
	if not string.find(filePath, ".test.") then
		print("This is not a test file.")
		return
	end
	require("toggleterm").exec("yarn:test:i " .. filePath, 2)
end, {})

vim.api.nvim_create_user_command("ServeApp", function()
	require("toggleterm").exec("yarn:serve", 1)
end, {})

vim.api.nvim_create_user_command("RunDev", function()
	require("toggleterm").exec("npm i && npm run dev", 1, 1)
end, {})
