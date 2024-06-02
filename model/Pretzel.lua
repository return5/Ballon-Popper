local Collectables = require('model.Collectables')
local setmetatable = setmetatable
local random = love.math.random

local Pretzel = {type = "pretzel"}
Pretzel.__index = Pretzel

setmetatable(Pretzel,Collectables)

_ENV = Pretzel

function Pretzel:update() end

function Pretzel:moveLeft(dt)
	if not Collectables.moveLeft(self,dt) then
		self.move = self.moveRight
	end
end

function Pretzel:moveRight(dt)
	if not Collectables.moveRight(self,dt) then
		self.move = self.moveLeft
	end
end

function Pretzel:new(x,y,hitBox,img,rot,speed,dir,points,sound)
	local pretzel = setmetatable(Collectables:new(x,y,hitBox,img,rot,speed,dir,points,sound),self)
	pretzel.move = pretzel.moveLeft
	return pretzel
end

return Pretzel
