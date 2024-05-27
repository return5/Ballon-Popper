local setmetatable = setmetatable

local Object = {}
Object.__index = Object

_ENV = Object

function Object:checkCollision(obj2)

end

function Object:new(x,y,hitBox)
	return setmetatable({x = x, y = y,prevX = x, prevY = y,hitBox = hitBox},self)
end

return Object
