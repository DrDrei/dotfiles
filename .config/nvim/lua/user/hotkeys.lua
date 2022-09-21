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
keymap("n", "<leader>fm", ":lua vim.lsp.buf.formatting_sync()<cr>", opts)
keymap("n", "U", "<C-r>", opts)


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

