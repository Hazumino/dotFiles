return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
  },
  {
    "xiyaowong/transparent.nvim",
  },
  { "neovim/nvim-lspconfig" },

  { "romainl/Apprentice" },
  {
    "Mofiqul/dracula.nvim",
    opts = {
      transparent_bg = true,
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },

  { "simrat39/rust-tools.nvim" },
}
