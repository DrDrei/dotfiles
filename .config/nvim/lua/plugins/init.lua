return {
  {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "xabikos/vscode-javascript",
    "kyazdani42/nvim-web-devicons",
    "akinsho/toggleterm.nvim",
    "dhruvmanila/telescope-bookmarks.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "github/copilot.vim",
    "wuelnerdotexe/vim-astro",
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
}
