

local floor = math.floor
local min = math.min
local max = math.max
local setColor = love.graphics.setColor
local rectangle = love.graphics.rectangle

local Bitmap = {}
local Bitmap_mt = { __index = Bitmap }


function Bitmap.new(width, height, tilewidth, tileheight)
	local o = setmetatable({}, Bitmap_mt)

	o._data = {}
	o._width = width
	o._height = height
	o._tilewidth = tilewidth
	o._tileheight = tileheight

	-- Init data
	for y = 0,o._height-1 do
		for x = 0,o._width-1 do
			table.insert(o._data, false)
		end
	end

	return o
end


function Bitmap:get(x, y)
	return self._data[x + y * self._width]
end


function Bitmap:set(x, y, value)
	self._data[x + y * self._width] = value
end


function Bitmap:get_width()
	return self._width
end


function Bitmap:get_height()
	return self._height
end


-- Check whether map coordinates are in the map
function Bitmap:in_bounds(x, y)
	return x >= 0 and y >= 0 and x < self._width and y < self._height
end


function Bitmap:pixel_to_map(x, y)
	local w, h = self._width, self._height
	local tw, th = self._tilewidth, self._tileheight
	return min(w-1, max(0, floor(x / tw))), min(h-1, max(0, floor(y / th)))
end


function Bitmap:load(data)
	for i, datum in ipairs(data) do
		if datum then
			data[i] = true
		else
			data[i] = false
		end
	end
end


function Bitmap:draw(r, g, b, a)

	local tilewidth, tileheight = self._tilewidth, self._tileheight

	setColor(r, g, b, a)
	for y = 0,self:get_width()-1 do
		for x = 0,self:get_height()-1 do
			if self:get(x, y) then
				rectangle(
					'fill',
					x * tilewidth,
					y * tileheight,
					tilewidth,
					tileheight
				)
			end
		end
	end
end


return Bitmap
