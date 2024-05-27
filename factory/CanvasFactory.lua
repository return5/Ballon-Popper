local newCanvas = love.graphics.newCanvas


local CanvasFactory = {}
CanvasFactory.__index = CanvasFactory

_ENV = CanvasFactory

function CanvasFactory.generateBackground()

end

return CanvasFactory
