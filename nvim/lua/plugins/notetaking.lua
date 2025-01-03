return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/Documents/UCL-CyberSecurity",
      },
    },

    -- see below for full list of options 👇
  },
  { "edluffy/hologram.nvim" },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup({
        backend = "kitty", -- or "ueberzugpp"
        integrations = {
          markdown = {
            enabled = true,
            only_render_image_at_cursor = true,
            resolve_image_path = function(document_path, image_path, fallback)
              -- Define the absolute path to your Assets directory
              local assets_dir = vim.fn.expand("~/Documents/UCL-CyberSecurity/Images/") -- not the path to vault, but to the assets dir

              -- Check if the image_path is already an absolute path
              if image_path:match("^/") then
                -- If it's an absolute path, leave it unchanged
                return image_path
              end

              -- Construct the new image path by prepending the Assets directory
              local new_image_path = assets_dir .. "/" .. image_path

              -- Check if the constructed path exists
              if vim.fn.filereadable(new_image_path) == 1 then
                return new_image_path
              else
                -- If the file doesn't exist in Assets, fallback to default behavior
                return fallback(document_path, image_path)
              end
            end,
            -- Additional image.nvim configurations
          },
        },
        -- Other image.nvim configurations
      })
    end,
  },
}
