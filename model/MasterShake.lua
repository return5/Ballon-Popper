local Character = require('model.Character')
local setmetatable = setmetatable

local MasterShake = {}
MasterShake.__index = MasterShake
setmetatable(MasterShake, Character)

_ENV = MasterShake

function MasterShake:checkCollision(obj)
	return self.hitBox:checkCollision(obj.hitBox) or self.hitBox2:checkCollision(obj.hitBox)
end

function MasterShake:updateHitBox()
	self.hitBox:update(self.x - self.prevX,self.y - self.prevY)
	self.hitBox2:update(self.x - self.prevX,self.y - self.prevY)
end

function MasterShake:new(x,y,hitBox,hitBox2,img,rot,speed,dir,pos)
	local masterShake = setmetatable(Character:new(x,y,hitBox,img,rot,speed,dir,pos),self)
	masterShake.hitBox2 = hitBox2
	return masterShake
end

return MasterShake
