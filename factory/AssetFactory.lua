local BalloonFactory = require('factory.BalloonFactory')
local CharacterFactory = require('factory.CharacterFactory')
local CanvasFactory = require('factory.CanvasFactory')

local AssetFactory = {}
AssetFactory.__index = AssetFactory

_ENV = AssetFactory


function AssetFactory.generateAssets(playerOneChoice,playerTwoChoice)
	local balloons = BalloonFactory.generateBalloons()
	local character1 = CharacterFactory.generateCharacter("shake")
	local character2 = CharacterFactory.generateCharacter("quinn")
	local character3 = CharacterFactory.generateCharacter("stormy")
	local background = CanvasFactory.generateBackground()
	return balloons,background,character1,character2,character3
end

return AssetFactory
