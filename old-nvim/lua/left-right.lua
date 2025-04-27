local M = {}

local api = require("nvim-tree.api")

-- function for left to assign to keybindings
local lefty = function()
  local node_at_cursor = api.tree.get_node_under_cursor()
  -- if it's a node and it's open, close
  if node_at_cursor.nodes and node_at_cursor.open then
    api.node.open.edit()
    -- else left jumps up to parent
  else
    api.node.navigate.parent()
  end
end
-- function for right to assign to keybindings
local righty = function()
  local node_at_cursor = api.tree.get_node_under_cursor()
  -- if it's a closed node, open it
  if node_at_cursor.nodes and not node_at_cursor.open then
    api.node.open.edit()
  end
end

M.left = lefty
M.right = righty

return M
