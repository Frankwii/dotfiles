require("iron.core").setup({

  config={
    python={
      command={"jupyter", "console", "--simple-prompt"}
    },
    repl_open_cmd = "botright split"
  },
  keymaps = {
    send_motion = "<leader>rc", -- Send a block of code
    visual_send = "<leader>rv", -- Send visually selected code
    send_file = "<leader>rf",   -- Send the entire file
    send_line = "<leader>rl",   -- Send the current line
  },
  -- highlight = {
  --   italic = true, -- Highlight sent code with italics
  -- },
})
