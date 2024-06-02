local CountDown = require('model.CountDown')
local tick = require('libs.tick')

local CountDownFactory = {}
CountDownFactory.__index = CountDownFactory

_ENV = CountDownFactory


local function countDownTimer(countDown)
	return function()
		countDown:countDown()
	end
end

function CountDownFactory.generateCountDown()
	local countDown = CountDown:new(30)
	tick.recur(countDownTimer(countDown),1)
	return countDown
end

return CountDownFactory
