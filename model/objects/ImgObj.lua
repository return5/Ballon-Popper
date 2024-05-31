local Object = require('model.objects.Object')
local setmetatable = setmetatable
local floor = math.floor
local draw = love.graphics.draw

local ImgObject = {}
ImgObject.__index = ImgObject
setmetatable(ImgObject,Object)

_ENV = ImgObject

function ImgObject:print()
	draw(self.img,self.x,self.y)--,self.rot,1,1,self.halfWidth,self.halfHeight)
end

function ImgObject:new(x,y,hitBox,img,rot)
	local imgObj = setmetatable(Object:new(x,y,hitBox),self)
	imgObj.img = img
	imgObj.rot = rot
	imgObj.width = img:getWidth()
	imgObj.height = img:getHeight()
	imgObj.halfWidth = floor(img:getWidth() / 2)
	imgObj.halfHeight = floor(img:getHeight() / 2)
	return imgObj
end

return ImgObject
