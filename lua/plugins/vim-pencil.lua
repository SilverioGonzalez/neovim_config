return {
  "preservim/vim-pencil",
  ft = { "markdown", "text", "org", "asciidoc" },
  init = function()
    vim.g["pencil#wrapModeDefault"] = "soft"
    vim.g["pencil#autoformat"] = 0
    vim.g["pencil#mode_indicators"] = 0 -- Prevents statusline overrides
    
    -- Crucial: Prevents Pencil from overriding window margin width
    vim.g["pencil#joinspaces"] = 0
  end,
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "text", "org", "asciidoc" },
      callback = function()
        vim.cmd("Pencil")
        vim.opt_local.conceallevel = 2
      end,
    })
  end,
  keys = {
    { "<leader>p", "<cmd>PencilToggle<cr>", desc = "Toggle Pencil Mode" },
    { "<leader>ps", "<cmd>SoftPencil<cr>",   desc = "Enable Soft Pencil Mode" },
    { "<leader>ph", "<cmd>HardPencil<cr>",   desc = "Enable Hard Pencil Mode" },
  },
}
