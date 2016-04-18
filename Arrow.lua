
local line = love.graphics.line
local setColor = love.graphics.setColor

local vec2 = require 'vec2'

local Arrow = {}
local Arrow_mt = { __index = Arrow }


function Arrow.new(pos, tip)
	local o = setmetatable({}, Arrow_mt)

	o._pos = pos
	o._tip = tip

	return o
end


function Arrow:position()
	return self._pos.x, self._pos.y
end


function Arrow:velocity()
	return vec2.sub(self._tip.x, self._tip.y, self._pos.x, self._pos.y)
end


function Arrow:draw(r, g, b, a)
	local x1, y1, x2, y2 = self._pos.x, self._pos.y, self._tip.x, self._tip.y
	setColor(r, g, b, a)
	line(x1, y1, x2, y2)

	-- TODO: Arrow tip
end


return Arrow
