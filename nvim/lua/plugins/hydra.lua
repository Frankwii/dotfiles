return {
    "nvimtools/hydra.nvim",
    lazy=true,
    config = function()
      local function keys(str)
        return function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), "m", true)
        end
      end

      local hydra = require("hydra")
      hydra({
        name = "Notebook mode",
        hint = [[
        _j_/_k_: move down/up  _r_: run cell
        _l_: run line  _R_: run above
        ^^     _<esc>_/_q_: exit ]],
        config = {
          color = "pink",
          invoke_on_body = true,
          hint = {
            border = "rounded", -- you can change the border if you want
          },
        },
        mode = { "n" },
        desc = "Start notebook hydra",
        body = "<leader>mH", -- this is the key that triggers the hydra
        heads = {
          { "j", keys("mb") },
          { "k", keys("Mb") },
          { "r", function()
            require("quarto.runner").run_cell()
            vim.api.nvim_feedkeys("zz","m",true)
          end },
          { "l", ":QuartoSendLine<CR>" },
          { "R", ":QuartoSendAbove<CR>" },
          { "<esc>", nil, { exit = true } },
          { "q", nil, { exit = true } },
        },
      })
    end
  }
