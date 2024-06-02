local tick = require("libs.tick")
local Collectable = require('model.Collectables')
local dir = require('config.Dir')
local config = require('config.Config')
local HitBox = require('model.HitBox')
local Pretzel = require('model.Pretzel')
local EmptyCharacter = require('model.EmptyCharacter')
local newImg = love.graphics.newImage
local random = love.math.random

local BalloonFactory = {}
BalloonFactory.__index = BalloonFactory

_ENV = BalloonFactory

local balloonImgs = {
	newImg('assets/img/balloons/balloon1.png'),
	newImg('assets/img/balloons/balloon2.png'),
	newImg('assets/img/balloons/balloon3.png'),
	newImg('assets/img/balloons/balloon4.png'),
	newImg('assets/img/balloons/balloon5.png')
}

local pretzelImg = newImg('assets/img/pretzel/pretzel1.png')
local pretzelSound = nil
local  balloonStartY = config.balloonStartY - balloonImgs[1]:getHeight()
local balloonSound = nil
local emptyPretzel = EmptyCharacter:new()

function BalloonFactory.createBalloon(balloonArr)
	local balloonImg = balloonImgs[random(1,#balloonImgs)]
	local balloonX = random(1,config.width - balloonImg:getWidth())
	local hitBox = HitBox:new(balloonX + 4,balloonStartY + 4,balloonImg:getWidth() - 4)
	local balloon = Collectable:new(balloonX,balloonStartY,hitBox,balloonImg,0,random(config.balloonSpeedMin,config.balloonSpeedMax),dir.UP,50,balloonSound)
	balloonArr[#balloonArr + 1] = balloon
end

local function balloonGenerator(balloonArr)
	return function()
		if random(1,9) <= 6 then
			BalloonFactory.createBalloon(balloonArr)
		end
	end
end

function BalloonFactory.generateBalloons()
	local balloonArr = {}
	tick.recur(balloonGenerator(balloonArr),0.35)
	return balloonArr
end

function BalloonFactory.generatePretzel()
	local pretzelX = random(1,config.width - pretzelImg:getWidth())
	local pretzelY = random(75,balloonStartY)
	local hitBox = HitBox:new(pretzelX + 4,pretzelY + 4,pretzelImg:getWidth() - 4)
	return Pretzel:new(pretzelX,pretzelY,hitBox,pretzelImg,0,200,dir.LEFT,250,pretzelSound)
end

function BalloonFactory.generatePretzelGenerator(pretzels)
	return function()
		if pretzels[1].type == "empty" and random(3,8) > 3  then
			pretzels[1] = BalloonFactory.generatePretzel()
		end
	end
end

function BalloonFactory.generateEmptyPretzel()
	return emptyPretzel
end

function BalloonFactory.generatePretzelsArr()
	local pretzels = {BalloonFactory.generateEmptyPretzel()}
	tick.recur(BalloonFactory.generatePretzelGenerator(pretzels),0.2)
	return pretzels
end

return BalloonFactory
