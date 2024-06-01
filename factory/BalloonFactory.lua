local tick = require("libs.tick")
local Balloon = require('model.Balloon')
local dir = require('config.Dir')
local config = require('config.Config')
local HitBox = require('model.HitBox')
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

local  balloonStartY = config.balloonStartY - balloonImgs[1]:getHeight()

function BalloonFactory.createBalloon(balloonArr)
	local balloonX = random(1,config.width)
	local balloonImg = balloonImgs[random(1,#balloonImgs)]
	local hitBox = HitBox:new(balloonX + 4,balloonStartY + 4,balloonImg:getWidth() - 6)
	local balloon = Balloon:new(balloonX,balloonStartY,hitBox,balloonImg,0,random(config.balloonSpeedMin,config.balloonSpeedMax),dir.UP)
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

return BalloonFactory
