local config = require('config.Config')

local setmetatable = setmetatable
local printF = love.graphics.printf
local newFont = love.graphics.newFont
local setFont = love.graphics.setFont
local getFont = love.graphics.getFont

local CountDown = {}
CountDown.__index = CountDown

_ENV = CountDown

local defaultFont = getFont()
local timerFont = newFont(25)
local timerPrintLimit = timerFont:getWidth('30')
local timerX = (config.width - timerPrintLimit) - timerFont:getWidth('1')
local timerY = (config.height - timerFont:getHeight('30')) - timerFont:getHeight('1')

function CountDown:print()
	setFont(timerFont)
	printF(self.time,timerX,timerY,timerPrintLimit,"right")
	setFont(defaultFont)
end

function CountDown:countDown()
	self.time = self.time - 1
end

function CountDown:new(time)
	return setmetatable({time = time},self)
end

return CountDown
