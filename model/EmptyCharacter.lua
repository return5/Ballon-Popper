local EmptyHitBox = require('model.EmptyHitBox')
local setmetatable = setmetatable

local EmptyCharacter = {type = "empty"}
EmptyCharacter.__index = EmptyCharacter

_ENV = EmptyCharacter

function EmptyCharacter:printScore()
	return true
end

function EmptyCharacter:print()
	return true
end

function EmptyCharacter:moveUp(dt)
	return true
end

function EmptyCharacter:moveDown(dt)
	return true
end

function EmptyCharacter:moveLeft(dt)
	return true
end

function EmptyCharacter:moveRight(dt)
	return true
end

function EmptyCharacter:checkBounds()
	return true
end

function EmptyCharacter:direction()
	return true
end

function EmptyCharacter:update()
	return true
end

function EmptyCharacter:move()
	return true
end

function EmptyCharacter:checkCollision()
	return false
end

function EmptyCharacter:new()
	return setmetatable({hitBox = EmptyHitBox:new()},self)
end

return EmptyCharacter
