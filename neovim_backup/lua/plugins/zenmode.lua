return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  },
  opts = {
    window = {
      backdrop = 0.95,
      width = 80,
      height = 1,
      options = {
        wrap = true,
        linebreak = true,
        signcolumn = "no",
        number = false,
        relativenumber = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = true,   -- Shows pending commands/keys in bottom right
        laststatus = 0,   -- Hides Lualine/statusline for a clean Zen look
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      todo = { enabled = false },
    },
    on_open = function(win)
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
      
      -- Enable built-in mode display at the bottom (-- NORMAL --, -- INSERT --)
      vim.opt.showmode = true
    end,
    on_close = function()
      -- Re-hide built-in mode display since Lualine takes over outside Zen mode
      vim.opt.showmode = false
    end,
  },
}
