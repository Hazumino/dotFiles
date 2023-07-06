-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("notify").setup({
  background_colour = "#000000",
})
require("transparent").setup({
  groups = { -- table: default groups
    "Normal",
    "Lazy",
    "NormalNC",
    "Comment",
    "Constant",
    "Special",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Underlined",
    "Todo",
    "String",
    "Function",
    "Conditional",
    "Repeat",
    "Notify",
    "Operator",
    "Structure",
    "LineNr",
    "NonText",
    "SignColumn",
    "CursorLineNr",
    "CursorLine",
    "EndOfBuffer",
    "rt",
  },
  extra_groups = { "NormalFloat", "NvimTreeNormal" }, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
