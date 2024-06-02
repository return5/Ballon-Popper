local BalloonFactory = require('factory.BalloonFactory')
local CharacterFactory = require('factory.CharacterFactory')
local CanvasFactory = require('factory.CanvasFactory')
local CountDownFactory = require('factory.CountDownFactory')

local AssetFactory = {}
AssetFactory.__index = AssetFactory

_ENV = AssetFactory

function AssetFactory.generateAssets(playerOneChoice,playerTwoChoice)
	local balloons = BalloonFactory.generateBalloons()
	local character1 = CharacterFactory.generateCharacter(playerOneChoice,0)
	local character2 = CharacterFactory.generateCharacter(playerTwoChoice,1)
	local background = CanvasFactory.generateBackground()
	local pretzelsArr = BalloonFactory.generatePretzelsArr()
	local countDown = CountDownFactory.generateCountDown()
	return balloons,background,character1,character2,pretzelsArr,countDown
end

return AssetFactory
