local fn = vim.fn

-- Automatically install lazy.nvim
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
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- local status_ok, packer = pcall(require, "packer")
-- if not status_ok then
-- 	return
-- end
--
-- packer.init({
-- 	display = {
-- 		open_fn = function()
-- 			return require("packer.util").float({})
-- 		end,
-- 	},
-- })

require("lazy").setup('plugins')
