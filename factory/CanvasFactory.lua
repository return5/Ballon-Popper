local newCanvas = love.graphics.newCanvas
local newImg = love.graphics.newImage
local draw = love.graphics.draw
local setCanvas = love.graphics.setCanvas
local setColor = love.graphics.setColor
local rectangle = love.graphics.rectangle
local getColor = love.graphics.getColor
local config = require('config.Config')


local CanvasFactory = {}
CanvasFactory.__index = CanvasFactory

_ENV = CanvasFactory

local backGroundImg = newImg("assets/img/background/background.png")
local red,green,blue = getColor()

function CanvasFactory.generateBackground()
	local bgCanvas = newCanvas(config.width,config.height)
	setCanvas(bgCanvas)
	draw(backGroundImg,0,config.height - backGroundImg:getHeight())
	setColor(0.1843,0.1843,0.1843)
	rectangle("fill",0,0,config.width,50)
	setCanvas()
	setColor(red,green,blue)
	return bgCanvas
end

return CanvasFactory
