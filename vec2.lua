
local sqrt = math.sqrt
local pow = math.pow

return {
	add = function(x1, y1, x2, y2)
		return x1 + x2, y1 + y2
	end,

	sub = function(x1, y1, x2, y2)
		return x1 - x2, y1 - y2
	end,

	mul = function(x, y, s)
		return x * s, y * s
	end,

	length = function(x, y)
		return sqrt(pow(x, 2) + pow(y, 2))
	end
}
