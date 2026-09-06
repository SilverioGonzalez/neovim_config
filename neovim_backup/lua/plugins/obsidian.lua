
return {
  "epwalsh/obsidian.nvim",
  version = "*",
  cmd = {
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianSearch",
    "NewZeroDraft", 
    "ObsidianBacklinks",
    "ObsidianLinks",
    "ObsidianFollowLink",
    "ObsidianTemplate",
    "ObsidianRename",
  },
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/Writing/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Writing/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- Notes
    { "<leader>zd", "<cmd>NewZeroDraft<CR>", desc = "Obsidian: ZeroDraftNote" },
   
    -- Note Creation & Search
    { "<leader>nn", "<cmd>ObsidianNew<CR>", desc = "Obsidian: New Note" },
    { "<leader>nf", "<cmd>ObsidianQuickSwitch<CR>", desc = "Obsidian: Find Note" },
    { "<leader>ns", "<cmd>ObsidianSearch<CR>", desc = "Obsidian: Search Text" },

    -- Links & Navigation
    { "<leader>nb", "<cmd>ObsidianBacklinks<CR>", desc = "Obsidian: Show Backlinks" },
    { "<leader>nl", "<cmd>ObsidianLinks<CR>", desc = "Obsidian: Show Outbound Links" },
    { "gf", "<cmd>ObsidianFollowLink<CR>", desc = "Obsidian: Follow Link" },

    -- Management
    { "<leader>no", "<cmd>ObsidianOpen<CR>", desc = "Obsidian: Open in GUI App" },
    { "<leader>nt", "<cmd>ObsidianTemplate<CR>", desc = "Obsidian: Insert Template" },
    { "<leader>nr", "<cmd>ObsidianRename<CR>", desc = "Obsidian: Rename Note" },
  },
  opts = {
    workspaces = {
      {
        name = "writing",
        path = "~/Writing",
      },
    },
    -- ADDED: Tell the plugin to output metadata for your auto-complete menu
    completion = {
      nvim_cmp = true, -- Set to true even if using blink.cmp (handles internal triggers)
      min_chars = 2,   -- Triggers link suggestions after typing 2 characters inside [[
    },
    daily_notes = {
      folder = "02_Zero_Draft",
      date_format = "%Y-%m-%d",
      alias_format = "%B %d, %Y",
      template = "Zero_Draft.md",
    },
    templates = {
      folder = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    ui = {
      enable = false,
    },
  },
}
