local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({})
    end,
  },
})

return packer.startup(function(use)
  use({
    'williamboman/mason.nvim',
    "williamboman/mason-lspconfig.nvim",
    'jose-elias-alvarez/null-ls.nvim',
    'neovim/nvim-lspconfig',
  })

  use({
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  })

  use({
    "Mofiqul/vscode.nvim",
    "kyazdani42/nvim-tree.lua",
    "tpope/vim-fugitive",
    "nvim-lualine/lualine.nvim",
    "akinsho/bufferline.nvim",
    "kyazdani42/nvim-web-devicons",
    "akinsho/toggleterm.nvim",
  })

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = { { 'nvim-lua/plenary.nvim' } },
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  })

  use("wbthomason/packer.nvim")
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
