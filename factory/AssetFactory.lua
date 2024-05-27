local BalloonFactory = require('factory.BalloonFactory')
local CharacterFactory = require('factory.CharacterFactory')
local CanvasFactory = require('factory.CanvasFactory')

local AssetFactory = {}
AssetFactory.__index = AssetFactory

_ENV = AssetFactory


function AssetFactory.generateAssets(playerChoice)
	local balloons = BalloonFactory.generateBalloons()
	local character1,character2 = CharacterFactory.generateCharacter(playerChoice)
	local background = CanvasFactory.generateBackground()
	return balloons,background,character1,character2
end

return AssetFactory
