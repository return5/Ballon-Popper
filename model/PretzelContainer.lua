local tick = require('libs.tick')
local Pretzel = require('model.Pretzel')
local HitBox = require('model.HitBox')
local config = require('config.Config')
local dir = require('config.Dir')
local newImg = love.graphics.newImage
local random = love.math.random
local emptyPretzel = require('model.EmptyCharacter'):new()
local setmetatable = setmetatable

local PretzelContainer = {}
PretzelContainer.__index = PretzelContainer

_ENV = PretzelContainer

local pretzelImg = newImg('assets/img/pretzel/pretzel1.png')
local pretzelSound = nil

local function generatePretzel()
	local pretzelX = random(1,config.width - pretzelImg:getWidth())
	local pretzelY = random(75,config.balloonStartY)
	local hitBox = HitBox:new(pretzelX + 4,pretzelY + 4,pretzelImg:getWidth() - 4)
	return Pretzel:new(pretzelX,pretzelY,hitBox,pretzelImg,0,200,dir.LEFT,250,pretzelSound)
end


local function generatePretzelGenerator(pretzelContainer)
	return function()
		if random(3,8) > 3  then
			pretzelContainer:createPretzel()
		end
	end
end

local function generatePretzelCountDown(pretzelContainer)
	return function()
		tick.remove(pretzelContainer.event)
		pretzelContainer.event = tick.recur(generatePretzelGenerator(pretzelContainer),0.2)
		pretzelContainer.pretzel = emptyPretzel
	end
end

function PretzelContainer:createPretzel()
	tick.remove(self.event)
	self.event = tick.delay(generatePretzelCountDown(self),6)
	self.pretzel = generatePretzel()
end

function PretzelContainer:print()
	self.pretzel:print()
end

function PretzelContainer:move(dt)
	self.pretzel:move(dt)
end

function PretzelContainer:getPretzel()
	return self.pretzel
end

function PretzelContainer:new()
	local pretzelContainer = setmetatable({pretzel = emptyPretzel},self)
	pretzelContainer.event = tick.recur(generatePretzelGenerator(pretzelContainer),0.2)
	return pretzelContainer
end

return PretzelContainer