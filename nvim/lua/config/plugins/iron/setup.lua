local get_python_interpreter = require("config.utils.interpreters").python

require("iron.core").setup({

  config={
    repl_definition={
      python={
        command=function()return {
          get_python_interpreter(),"-m","ipython","--simple-prompt"
        }end
      },
      quarto={command=get_python_interpreter},
      repl_open_cmd = "botright split"
    },
    send_multiline=true
  },
  keymaps={
    visual_send="<leader>rv"
  }
})
