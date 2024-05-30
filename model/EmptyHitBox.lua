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
	return setmetatable({},self)
end

return EmptyHitBox
