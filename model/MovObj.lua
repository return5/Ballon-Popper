local ImgObj = require('model.ImgObj')
local setmetatable = setmetatable
local config = require('config.Config')

local MovObject = {}
MovObject.__index = MovObject
setmetatable(MovObject,ImgObj)

_ENV = MovObject

function MovObject:checkBounds()
	if self.x < 0 or self.x > config.width or self.y < 0 or self.y > config.height then
		self.y = self.prevY
		self.x = self.prevX
		return false
	end
	return true
end

function MovObject:direction(newDir)
	self.dir = newDir
end

function MovObject:moveUp(dt)
	self.prevY = self.y
	self.y = self.y - dt * self.speed
	return self:checkBounds()
end

function MovObject:moveDown(dt)
	self.prevY = self.y
	self.y = self.y + dt * self.speed
	return self:checkBounds()
end

function MovObject:moveLeft(dt)
	self.prevX = self.x
	self.x = self.x - dt * self.speed
	return self:checkBounds()
end

function MovObject:moveRight(dt)
	self.prevX = self.x
	self.x = self.x + dt * self.speed
	return self:checkBounds()
end

function MovObject:new(x,y,hitBox,img,rot,speed,dir)
	local movObj = setmetatable(ImgObj:new(x,y,hitBox,img,rot),self)
	movObj.speed = speed
	movObj.dir = dir
	return movObj
end

return MovObject
