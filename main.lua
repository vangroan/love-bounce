
local Arrow = require 'Arrow'
local Bitmap = require 'Bitmap'
local physics = require 'physics'
local Tool = require 'Tool'

local bitmap, tool, vel_arrow


function love.load()
	bitmap = Bitmap.new(32, 32, 8, 8)
	tool = Tool.new(bitmap, vel_arrow)
	tool:select('terrain')
	vel_arrow = Arrow.new({x=16, y=16}, {x=160, y=160})
end


function love.update(delta)
	tool:update(delta)
	local posx, posy = vel_arrow:position()
	local velx, vely = vel_arrow:velocity()
	physics.bounce(bitmap, posx, posy, velx, vely)
end


function love.draw()
	bitmap:draw(0, 255, 125, 255)
	vel_arrow:draw(255, 125, 0, 255)
end
