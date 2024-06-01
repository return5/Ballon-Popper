local MovObj = require('model.objects.MovObj')
local setmetatable = setmetatable

local MasterShake = {}
MasterShake.__index = MasterShake
setmetatable(MasterShake,MovObj)

_ENV = MasterShake

function MasterShake:checkCollision(obj)
	return self.hitBox:checkCollision(obj.hitBox) and self.hitBox2:checkCollision(obj.hitBox)
end

function MasterShake:updateHitBox()
	self.hitBox:update(self.x - self.prevX,self.y - self.prevY)
	self.hitBox2:update(self.x - self.prevX,self.y - self.prevY)
end

function MasterShake:new(x,y,hitBox,hitBox2,img,rot,speed,dir)
	local masterShake = setmetatable(MovObj:new(x,y,hitBox,img,rot,speed,dir),self)
	masterShake.hitBox2 = hitBox2
	return masterShake
end

return MasterShake
