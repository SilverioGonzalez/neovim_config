return {
  dir = vim.fn.stdpath("config"),
  name = "native-wordcount",
  config = function()
    local win_id = nil

    vim.api.nvim_create_user_command("WordCount", function()
      -- Close existing window if toggled off
      if win_id and vim.api.nvim_win_is_valid(win_id) then
        vim.api.nvim_win_close(win_id, true)
        win_id = nil
        return
      end

      -- Native word count calculation
      local wc = vim.fn.wordcount()
      local count = wc.visual_words or wc.words or 0
      local text = string.format(" %d words ", count)

      -- Calculate bottom-right positioning
      local width = #text
      local height = 1
      local col = vim.o.columns - width - 2
      local row = vim.o.lines - vim.o.cmdheight - 3

      -- Create buffer and render float
      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, { text })

      win_id = vim.api.nvim_open_win(buf, false, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
        focusable = false,
      })
    end, { desc = "Toggle Native Word Count Overlay" })
  end,
  keys = {
    { "<leader>pc", "<cmd>WordCount<cr>", desc = "Toggle Word Count (Bottom-Right)" },
  },
}
