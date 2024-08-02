--- TODO: Create a file

M={}

local function expand_home_path(path)
  -- Get the value of the home directory from the environment variables
  local home = os.getenv("HOME")
  -- Replace the tilde at the start of the path with the home directory path
  return path:gsub("^~", home)
end

function get_bookmarked_files(bookmarkpath)
  bookmarkpath = bookmarkpath or "~/.config/nvim/lua/config/plugins/which-key/bookmarks"

  bookmarkpath = expand_home_path(bookmarkpath)

  -- Initialize an empty table to store file lines
  local bookmarked_files = {}

  -- Open the file in read mode
  local file = io.open(bookmarkpath, "r")

  -- Check if the file was successfully opened
  if not file then
    -- If file can't be opened, print an error message and return nil
    vim.notify("Error: Unable to open file at " .. bookmarkpath, vim.log.levels.ERROR)
    return {}
  end

  -- Iterate over each line in the file
  for line in file:lines() do
    -- Add each line to the bookmarked_files table
    table.insert(bookmarked_files, line)
  end

  -- Close the file
  file:close()

  -- Return the table containing file lines
  return bookmarked_files
end

--- TODO: Add graphical interface, as in nvim-tree
local function open_file(path)
  -- TODO nvim.api.nvim_set_current_buf(choose_buffer())
  vim.cmd('edit '..path)
end

-- TODO: graphical interface
-- local function choose_buffer()
--   local curbuf = vim.api.nvim_list_wins()
-- end

M.create_mappings = function()
  local keys = {
    -- Lowercase a-z
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",

    -- Uppercase A-Z
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
  }
  local keymaps = {}
  local bookmarked_files = get_bookmarked_files()

  for index,filepath in ipairs(bookmarked_files) do
    keymaps[index] = {keys[index],function()open_file(filepath)end,desc=filepath}
  end

  return keymaps
end

return M
