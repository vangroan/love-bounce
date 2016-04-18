
local vec2 = require 'vec2'

local physics = {}

-- Length of backstep
local BACK_STEP = 12.0

-- Truncate a vector by s
function trunc_vec(x, y, s)
	local m = vec2.length(x, y)
	local l = 0.0

	if not m then
		l = 1.0 - s
	else
		l = 1.0 - s / m
	end

	return x * l, y * l
end


-- Assumes that the position is not inside the terrain
function physics.bounce(bitmap, posx, posy, velx, vely)
	-- The future position
	local tx, ty = vec2.add(posx, posy, velx, vely)
	local ti, tj = bitmap:pixel_to_map(tx, ty)

	-- Check whether the target position is in terrain
	local tile = bitmap:get(ti, tj)
	while tile do
		-- Step backwards until in open air
		tx, ty = trunc_vec(tx, ty, BACK_STEP)
		ti, tj = bitmap:pixel_to_map(tx, ty)
		tile = bitmap:get(ti, tj)
	end

	-- TODO: The remainder of the truncated velocity
end


return physics
