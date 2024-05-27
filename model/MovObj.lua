local ImgObj = require('model.ImgObj')
local setmetatable = setmetatable

local MovObject = {}
MovObject.__index = MovObject
setmetatable(MovObject,ImgObj)

_ENV = MovObject

function MovObject:direction(newDir)
	self.dir = newDir
end

function MovObject:moveUp(dt)
	self.prevY = self.y
	self.y = self.y + dt * self.speed
end

function MovObject:moveDown(dt)
	self.prevY = self.y
	self.y = self.y - dt * self.speed

end

function MovObject:moveLeft(dt)
	self.prevX = self.x
	self.x = self.x - dt * self.speed

end

function MovObject:moveRight(dt)
	self.prevX = self.x
	self.x = self.x + dt * self.speed

end

function MovObject:new(x,y,hitBox,img,rot,speed,dir)
	local movObj = setmetatable(ImgObj:new(x,y,hitBox,img,rot),self)
	movObj.speed = speed
	movObj.dir = dir
	return movObj
end

return MovObject
