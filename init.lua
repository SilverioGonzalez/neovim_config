vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Tab spacing 
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- UI Left-Edge Padding & Line Numbers
vim.opt.number = true          -- Turn on line numbers
vim.opt.numberwidth = 4        -- Guarantees at least 4 columns of width for numbers
vim.opt.signcolumn = "yes:1"   -- Adds an extra column next to the numbers for padding

-- Sync Neovim clipboard with System Clipboard
vim.opt.clipboard = "unnamedplus"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Automatically import any lua files inside ~/.config/nvim/lua/plugins/
    { import = "plugins" },

    -- Lualine status bar configuration
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "echasnovski/mini.icons" },
      opts = {
        options = {
          theme = "auto",
        },
      },
    },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

-- Clipboard Keymaps (Cmd+C / Cmd+V / Cmd+P)
vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<D-v>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<D-p>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("i", "<D-v>", "<C-r>+", { desc = "Paste in insert mode" })
vim.keymap.set("i", "<D-p>", "<C-r>+", { desc = "Paste in insert mode" })

-- Select All (Cmd+A)
vim.keymap.set({ "n", "i", "v" }, "<D-a>", "<Esc>ggVG", { desc = "Select all lines" })


