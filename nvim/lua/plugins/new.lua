return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
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
  { "Mofiqul/dracula.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },

  { "simrat39/rust-tools.nvim" },
}
