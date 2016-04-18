

local isMouseDown = love.mouse.isDown
local getMousePos = love.mouse.getPosition
local setCursor = love.mouse.setCursor


-- ------------
-- Tool Manager
-- ------------

local Tool = {}
local Tool_mt = { __index = Tool }


function Tool.new(bitmap, arrow)
	local o = setmetatable({}, Tool_mt)

	o.hand = love.mouse.getSystemCursor('hand')
	o.bitmap = bitmap
	o.arrow = arrow
	o.current = ''
	
	return o
end


function Tool:select(tool_label)
	self.current = tool_label
end


function Tool:update(delta)
	if self.current == 'terrain' then
		self:update_terrain(delta)
	end
end


function Tool:update_terrain(delta)
	local x, y = getMousePos()
	local i, j = self.bitmap:pixel_to_map(x, y)
	if isMouseDown('l') then
		-- Paint
		self.bitmap:set(i, j, true)
	elseif isMouseDown('r') then
		-- Erase
		self.bitmap:set(i, j, false)
	end
end


return Tool
