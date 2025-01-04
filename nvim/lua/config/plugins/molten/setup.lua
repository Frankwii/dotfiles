-- Hate global variables..
local globals={
  molten_image_provider="image.nvim",
  molten_output_win_max_height=20,
  molten_wrap_output=true,
  molten_virt_text_output=true,
  molten_virt_lines_off_by_1=true,
  molten_auto_open_output=false,
}

for key, value in pairs(globals) do
  vim.g[key]=value
end
