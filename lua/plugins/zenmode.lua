
return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    {
      "<leader>tw",
      function()
        local buf = vim.api.nvim_get_current_buf()
        local has_parser, parser = pcall(vim.treesitter.get_parser, buf)
        if has_parser and parser then
          vim.cmd("Twilight")
        else
          vim.notify("Twilight requires a valid filetype with syntax structure!", vim.log.levels.WARN)
        end
      end,
      desc = "Toggle Twilight Safely",
    },
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
        showcmd = true,   
        laststatus = 0,   
      },
      twilight = { enabled = false },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      todo = { enabled = false },
    },
    on_open = function(win)
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
      vim.opt.showmode = true

      local buf = vim.api.nvim_win_get_buf(win)
      local has_parser, parser = pcall(vim.treesitter.get_parser, buf)
      if has_parser and parser then
        -- We defer execution slightly to allow Neovim to stabilize the UI window layout
        vim.schedule(function()
          pcall(vim.cmd, "TwilightEnable")
        end)
      end
    end,
    on_close = function()
      vim.opt.showmode = false
      pcall(vim.cmd, "TwilightDisable")
    end,
  },
}

