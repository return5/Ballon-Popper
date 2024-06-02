local BalloonFactory = require('factory.BalloonFactory')
local CharacterFactory = require('factory.CharacterFactory')
local CanvasFactory = require('factory.CanvasFactory')
local CountDownFactory = require('factory.CountDownFactory')
local PretzelContainer = require('model.PretzelContainer')

local AssetFactory = {}
AssetFactory.__index = AssetFactory

_ENV = AssetFactory

function AssetFactory.generateCharacters(playerOneChoice,playerTwoChoice)
	local character1 = CharacterFactory.generateCharacter(playerOneChoice,0)
	local character2 = CharacterFactory.generateCharacter(playerTwoChoice,1)
	return character1,character2
end

function AssetFactory.initCharacters()
	return CharacterFactory.generateEmpty(),CharacterFactory.generateEmpty()
end

function AssetFactory.generateAssets()
	local balloons = BalloonFactory.generateBalloons()
	local background = CanvasFactory.generateBackground()
	return balloons,background,PretzelContainer:new()
end

function AssetFactory.generateCountDown()
	return CountDownFactory.generateCountDown()
end


return AssetFactory
