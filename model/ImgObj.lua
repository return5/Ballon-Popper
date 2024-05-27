local Object = require('model.Object')
local setmetatable = setmetatable

local ImgObject = {}
ImgObject.__index = ImgObject
setmetatable(ImgObject,Object)

_ENV = ImgObject

function ImgObject:print()

end


function ImgObject:new(x,y,hitBox,img,rot)
	local imgObj = setmetatable(Object:new(x,y,hitBox),self)
	imgObj.img = img
	imgObj.rot = rot
	return imgObj
end

return ImgObject
