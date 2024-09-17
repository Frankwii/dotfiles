local tree_api = require('nvim-tree.api')
local keymap = vim.keymap.set

local M = {}

-- Function assigning maps
function M.treemappings(bufnr)
  local function opts(desc)
    return { desc = 'Tree: ' .. desc, buffer = bufnr , noremap = true, silent = true }
  end
  local function under_cursor(func)
    func(tree_api.tree.get_node_under_cursor())
  end

  keymap('n','q',tree_api.tree.close, opts('Close tree'))
  keymap('n','h',tree_api.node.navigate.parent_close, opts('Close directory'))
  keymap('n','H',tree_api.tree.change_root_to_parent, opts('Change root to parent'))
  keymap('n', 'l', tree_api.node.open.edit, opts('Open node'))
  keymap('n', 'L', function() tree_api.tree.change_root_to_node() tree_api.node.navigate.sibling.first() end, opts('Change root to current node'))
  keymap('n', 'J', tree_api.node.navigate.sibling.last, opts('Last Sibling'))
  keymap('n', 'K', tree_api.node.navigate.sibling.first, opts('First Sibling'))
  keymap('n', '?', tree_api.tree.toggle_help, opts('Help'))
  keymap('n', '.', tree_api.tree.toggle_hidden_filter, opts('Toggle dotfiles'))
  keymap('n', 'n', tree_api.fs.create, opts('Create file'))
  keymap('n', 'r', tree_api.fs.rename_node, opts('Rename file or folder'))
  keymap('n', 'ss', tree_api.node.open.vertical, opts('Split vertical'))
  keymap('n', 'sv', tree_api.node.open.horizontal, opts('Split horizontal'))
  keymap('n', 'st', tree_api.node.open.tab, opts('Split newtab'))

  -- Marks-related
  keymap('n', 'm', function()
    under_cursor(tree_api.marks.toggle)
    vim.api.nvim_feedkeys('j','n',false) -- press j; this emulates nnn behavior
  end, opts('Toggle mark'))
  keymap('n','c',tree_api.marks.clear,opts('Clear marks'))

  -- local function bulk_delete()
    --if tree_api.marks.list() == nil then
      --under_cursor(tree_api.fs.remove)
    --else
      -- tree_api.marks.bulk.delete
    --end
  -- end
  local function bulk_delete()
    if next(tree_api.marks.list()) == nil then
      under_cursor(tree_api.fs.remove)
    else 
      tree_api.marks.bulk.delete()
    end
  end
  keymap('n','x',bulk_delete,opts('Delete marked files'))
  
  local function bulk_paste()
    local marked_nodes = tree_api.marks.list()
    if next(marked_nodes) == nil then
      vim.api.nvim_echo({{"No nodes marked","None"}},false,{})
    else 
      for _, node in ipairs(marked_nodes) do
        tree_api.fs.copy.node(node)
        under_cursor(tree_api.fs.paste)
      end
      tree_api.fs.clear_clipboard()
    end
  end
  keymap('n', 'p',bulk_paste, opts('Paste marked files'))

  local function bulk_move()
    local marked_nodes = tree_api.marks.list()
    if next(marked_nodes) == nil then
      vim.api.nvim_echo({{"No nodes marked","None"}},false,{})
    else 
      for _, node in ipairs(marked_nodes) do
        tree_api.fs.cut(node)
        under_cursor(tree_api.fs.paste)
      end
      tree_api.fs.clear_clipboard()
    end
  end
  keymap('n','v',bulk_move,opts('Move marked files'))
end

return M
