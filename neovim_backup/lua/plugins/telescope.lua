return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x", -- Using branch instead of version '*' is recommended by Telescope maintainers
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text (Live Grep)" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        path_display = { "smart" },
      },
    })
    -- Load fzf extension if compiled successfully
    pcall(telescope.load_extension, "fzf")
  end,
}
