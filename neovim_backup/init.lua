vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Tab spacing 
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

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

-- Terminal UI settings: Hide line numbers and auto-enter typing mode
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- Open a small terminal pane at the bottom (<Space>st)
vim.keymap.set("n", "<space>st", function()
  vim.cmd("new")                    -- Opens horizontal split at the top/bottom
  vim.cmd.wincmd("J")              -- Forces split to full width at the bottom
  vim.api.nvim_win_set_height(0, 12) -- Sets terminal height to 12 lines
  vim.cmd.term()                   -- Starts terminal session
  vim.cmd("startinsert")            -- Instantly switch to terminal typing mode
end, { desc = "Open Terminal Pane", nowait = true })

