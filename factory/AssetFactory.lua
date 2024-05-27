local BalloonFactory = require('factory.BalloonFactory')
local CharacterFactory = require('factory.CharacterFactory')
local CanvasFactory = require('factory.CanvasFactory')

local AssetFactory = {}
AssetFactory.__index = AssetFactory

_ENV = AssetFactory


function AssetFactory.generateAssets(playerChoice)
	local balloons = BalloonFactory.generateBalloons()
	local character = CharacterFactory.generateCharacter(playerChoice)
	local background = CanvasFactory.generateBackground()
	return balloons,character,background
end

return AssetFactory
