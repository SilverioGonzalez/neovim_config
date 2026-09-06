return {
  "stevearc/oil.nvim",
  opts = {
    -- Default open command uses float
    default_file_explorer = true,
    float = {
      padding = 2,
      max_width = 50,  -- Fixed width of 50 columns (or use 0.4 for 40% screen width)
      max_height = 15, -- Fixed height of 15 lines (or use 0.4 for 40% screen height)
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
  },
  dependencies = { "echasnovski/mini.icons" },
  lazy = false,
  keys = {
    { "<space>e", "<cmd>Oil --float<cr>", desc = "Open Oil floating window" },
    { "-", "<cmd>Oil --float<cr>", desc = "Open parent directory in float" },
  },
}
