local HItBox = require('model.HitBox')
local setmetatable = setmetatable

local EmptyHitBox = {}
EmptyHitBox.__index = EmptyHitBox

_ENV = EmptyHitBox

function EmptyHitBox:print()
	return true
end

function EmptyHitBox:checkCollision()
	return false
end

function EmptyHitBox:update()
	return true
end

function EmptyHitBox:new()
	return setmetatable(HItBox:new(-1,-1,0),self)
end

return EmptyHitBox
