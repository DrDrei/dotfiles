local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return {
	{
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		"xabikos/vscode-javascript",
		"Mofiqul/vscode.nvim",
		"kyazdani42/nvim-tree.lua",
		"kyazdani42/nvim-web-devicons",
		"akinsho/toggleterm.nvim",
		"dhruvmanila/telescope-bookmarks.nvim",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"github/copilot.vim",
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
}
