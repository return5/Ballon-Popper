local setmetatable = setmetatable
local points = love.graphics.points

local HitBox = {}
HitBox.__index = HitBox

_ENV = HitBox

function HitBox:print()
	points(self.x,self.y,self.x,self.y_height,self.x_width,self.y,self.x_width,self.y_height)
end

function HitBox:checkYWithinHb2(hB2)
	return ((self.y_height <= hB2.y_height and self.y_height >= hB2.y) or (self.y >= hB2.y and self.y <= hB2.y_height) or
			(self.y <= hB2.y and self.y_height >= hB2.y_height))
end

function HitBox:checkLeftSideCollision(hB2)
	return (self.x >= hB2.x and self.x <= hB2.x_width) and self:checkYWithinHb2(hB2)
end

function HitBox:checkRightSideCollision(hB2)
	return (self.x_width >= hB2.x and self.x_width <= hB2.x_width) and self:checkYWithinHb2(hB2)
end

function HitBox:checkXWithinHb2(hB2)
	return ((self.x_width <= hB2.x_width and self.x_width >= hB2.x) or (self.x <= hB2.x and self.x_width >= hB2.x_width))
end

function HitBox:checkBottomSideCollision(hB2)
	return (self.y <= hB2.y and self.y >= hB2.y_height) and self:checkXWithinHb2(hB2)
end

function HitBox:checkTopSideCollision(hB2)
	return (self.y_height >= hB2.y and self.y_height <= hB2.y_height) and self:checkXWithinHb2(hB2)
end

function HitBox:checkCollision(hB2)
	return self:checkRightSideCollision(hB2) and self:checkLeftSideCollision(hB2) and self:checkBottomSideCollision(hB2) and self:checkTopSideCollision(hB2)
end

function HitBox:update(xDiff,yDiff)
	self.x = self.x + xDiff
	self.y = self.y + yDiff
	self.x_width = self.x_width + xDiff
	self.y_height = self.y_height + yDiff
end

function HitBox:new(x,y,size)
	return setmetatable({x = x, y = y,x_width = x + size,y_height = y + size,size = size},self)
end

return HitBox
