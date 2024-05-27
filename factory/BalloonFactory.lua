local tick = require("libs.tick")
local Balloon = require('model.Balloon')
local dir = require('config.Dir')
local config = require('config.Config')
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
function BalloonFactory.createBalloon(balloonArr)
	local balloonX = random(1,config.width)
	local balloon = Balloon:new(balloonX,config.balloonStartY,0,balloonImgs[random(1,#balloonImgs)],0,random(config.balloonSpeedMin,config.balloonSpeedMax),dir.UP)
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
	BalloonFactory.createBalloon(balloonArr)
	tick.recur(balloonGenerator(balloonArr),0.35)
	return balloonArr
end

return BalloonFactory
