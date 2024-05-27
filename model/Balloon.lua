local MovObj = require('model.MovObj')
local setmetatable = setmetatable

local Balloon = {}
Balloon.__index = Balloon
setmetatable(Balloon,MovObj)

_ENV = Balloon

function Balloon:update(dt)
	return self:moveUp(dt)
end

function Balloon:new(x,y,hitBox,img,rot,speed,dir)
	return setmetatable(MovObj:new(x,y,hitBox,img,rot,speed,dir),self)
end

return Balloon
