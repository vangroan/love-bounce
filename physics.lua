
local vec2 = require 'vec2'

local physics = {}


-- Assumes that the position is not inside the terrain
function physics.bounce(bitmap, posx, posy, velx, vely)
	-- The future position
	local tx, ty = vec2.add(posx, posy, velx, vely)
	local ti, tj = bitmap:pixel_to_map(tx, ty)

	-- Check whether the target position is in terrain
	-- TODO: While loop
	local tile = bitmap:get(ti, tj)
	if tile then
		-- Step backwards
	end
end


return physics
