local newCanvas = love.graphics.newCanvas
local newImg = love.graphics.newImage
local draw = love.graphics.draw
local setCanvas = love.graphics.setCanvas
local setColor = love.graphics.setColor
local rectangle = love.graphics.rectangle
local getColor = love.graphics.getColor
local floor = math.floor
local config = require('config.Config')


local CanvasFactory = {}
CanvasFactory.__index = CanvasFactory

_ENV = CanvasFactory

local backGroundImg = newImg("assets/img/background/background.png")
local cloud = newImg('assets/img/background/cloud.png')
local red,green,blue = getColor()
local cloudHalf = cloud:getWidth() / 2
local cloudThird = cloud:getWidth() / 3


local function generateRowOfClouds(startY,startX,limit)
	local cloudX = startX
	for i=1,limit,1 do
		draw(cloud,cloudX,startY)
		cloudX = cloudX + cloud:getWidth() + cloudHalf
	end
end

local function generateClouds()
	local widthLimit = floor(config.width / cloud:getWidth())
	local heightLimit = floor((config.height - backGroundImg:getHeight() - (cloud:getHeight() + 75)) / cloud:getHeight())
	local startY = 75
	local startX = - cloudHalf
	for i=1,heightLimit,1 do
		generateRowOfClouds(startY,startX,widthLimit)
		startY =  startY + cloud:getHeight() + (cloudThird)
		startX = (i % 2) * (cloudHalf) - (cloudHalf)
	end
end

function CanvasFactory.generateBackground()
	local bgCanvas = newCanvas(config.width,config.height)
	setCanvas(bgCanvas)
	setColor(0.295,0.735,1)
	rectangle("fill",0,0,config.width,config.height)
	setColor(red,green,blue)
	generateClouds()
	draw(backGroundImg,0,config.height - backGroundImg:getHeight())
	setColor(0.1843,0.1843,0.1843)
	rectangle("fill",0,0,config.width,80)
	setCanvas()
	setColor(red,green,blue)
	return bgCanvas
end

return CanvasFactory
