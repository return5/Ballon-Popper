local MovObj = require('model.objects.MovObj')
local setmetatable = setmetatable

local Collectable = {}
Collectable.__index = Collectable
setmetatable(Collectable,MovObj)

_ENV = Collectable

function Collectable:update(dt)
	return self:moveUp(dt)
end

function Collectable:playSound()

end

function Collectable:new(x,y,hitBox,img,rot,speed,dir,points,sound)
	local collectable = setmetatable(MovObj:new(x,y,hitBox,img,rot,speed,dir),self)
	collectable.sound = sound
	collectable.points = points
	return collectable
end

return Collectable
