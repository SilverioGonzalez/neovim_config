
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Native 0.12 configuration setup
    local configs = require("nvim-treesitter")
    
    configs.setup({
      -- Parsers you want loaded on startup
      ensure_installed = { "lua", "vim", "vimdoc", "markdown", "python" }, 
      sync_install = false,
    })

    -- In v0.12, you manually toggle the native highlighters using autocommands
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "vim", "markdown", "python" },
      callback = function()
        vim.treesitter.start() -- This native command enables highlighting
      end,
    })
  end,
}
