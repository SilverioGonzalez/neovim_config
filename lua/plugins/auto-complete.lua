return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    
    -- 1. Control when the menu is allowed to show up automatically
    opts.completion = {
      -- Only automatically open if typing a trigger character (like '[')
      autocomplete = { cmp.TriggerEvent.TextChanged }, 
    }

    -- 2. Merge obsidian sources into your existing configuration
    opts.sources = cmp.config.sources({
      { name = "obsidian", keyword_length = 2 },
      { name = "obsidian_new", keyword_length = 2 },
    }, {
      -- Put standard text/buffer completion in a lower priority group 
      -- or remove 'buffer' entirely to stop casual word suggestions
      { name = "buffer", keyword_length = 5 }, 
    })
  end,
}

