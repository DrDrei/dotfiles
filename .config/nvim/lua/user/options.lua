local options = {
  backup = false, -- no backupfile
  clipboard = "unnamedplus", -- access system clipboard
  completeopt = { "menu", "menuone", "noselect" }, -- set cmp stuff
  fileencoding = "utf-8", -- encode all files to utf-8
  hlsearch = true, -- highlight search
  mouse = "a", -- allow mouse
  pumheight = 10, -- pop up menu height
  showmode = false, -- hide 'mode' display
  showtabline = 2, -- show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  autoindent = true,
  splitbelow = true, -- open split below
  splitright = true, -- open split to the right
  swapfile = false, -- creates a swapfile
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 12, -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  ignorecase = true,
  termguicolors = true,
  hidden = true,
  ch = 0, -- command height
}

vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

vim.opt.cpoptions:append("y") -- save yanks to allow redo with '.' key
vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end
