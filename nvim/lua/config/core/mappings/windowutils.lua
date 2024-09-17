local getwin = vim.api.nvim_get_current_win
local setwin = vim.api.nvim_set_current_win
local getwidth = vim.api.nvim_win_get_width
local setwidth = vim.api.nvim_win_set_width
local getheight = vim.api.nvim_win_get_height
local setheight = vim.api.nvim_win_set_height

local function increaseWidth(window,amount)
  --- Increase width of {window} by {amount} units. Can also decrease the width if {amount} is a negative number
  win = getwin()
  setwidth(win,getwidth(win)+amount)
end

local function increaseHeight(window,amount)
  --- Increase height of {window} by {amount} units. Can also decrease the width if {amount} is a negative number
  win = getwin()
  setheight(win,getheight(win)+amount)
end

local M = {}

M.isRightMost = function()
	local curwin = getwin()
	vim.cmd("wincmd l")
	local rightwin = getwin()
	if curwin == rightwin then
		return true
	else
		setwin(curwin)
		return false
	end
end

M.isLeftMost = function()
	local curwin = getwin()
	vim.cmd("wincmd h")
	local leftwin = getwin()
	if curwin == leftwin then
		return true
	else
    setwin(curwin)
		return false
	end
end

M.isBottomMost = function()
	local curwin = getwin()
	vim.cmd("wincmd j")
	local bottomwin = getwin()
	if curwin == bottomwin then
		return true
	else
    setwin(curwin)
		return false
	end
end

M.isTopMost = function()
	local curwin = getwin()
	vim.cmd("wincmd k")
	local topwin = getwin()
	if curwin == topwin then
		return true
	else
    setwin(curwin)
		return false
	end
end

M.ResizeLeft = function()
	if M.isRightMost() then
		if not M.isLeftMost() then
			increaseWidth(getwin(),1)
		end
	else
		increaseWidth(getwin(),-1)
	end
end

M.ResizeRight = function()
	if M.isRightMost() then
		if not M.isLeftMost() then
			increaseWidth(getwin(),-1)
		end
	else
		increaseWidth(getwin(),1)
	end
end

M.ResizeUp = function()
	if M.isBottomMost() then
		if not M.isTopMost() then
			increaseHeight(getwin(),1)
		end
	else
		increaseHeight(getwin(),-1)
	end
end

M.ResizeDown = function()
	if M.isBottomMost() then
		if not M.isTopMost() then
			increaseHeight(getwin(),-1)
		end
	else
		increaseHeight(getwin(),1)
	end
end

-- Tab utils
local function keystrokeToTab(keystroke)
  local tabpages = vim.api.nvim_list_tabpages()
  if keystroke > #tabpages then
    return tabpages[#tabpages]
  else
    return tabpages[keystroke]
  end
end

M.goToTab = function(keystroke)
  vim.api.nvim_set_current_tabpage(keystrokeToTab(keystroke)) 
end

return M
