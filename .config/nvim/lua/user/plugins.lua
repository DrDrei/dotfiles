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
  use("Mofiqul/vscode.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("tpope/vim-fugitive")
  use("nvim-lualine/lualine.nvim")
  use("akinsho/bufferline.nvim")
  use("kyazdani42/nvim-web-devicons")
  use({
    "nvim-telescope/telescope.nvim",
    requires = { {'nvim-lua/plenary.nvim'} },
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
