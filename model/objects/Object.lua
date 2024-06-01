local setmetatable = setmetatable

local Object = {}
Object.__index = Object

_ENV = Object

function Object:checkCollision(obj)
	return self.hitBox:checkCollision(obj.hitBox)
end

function Object:new(x,y,hitBox)
	return setmetatable({x = x, y = y,hitBox = hitBox},self)
end

return Object
