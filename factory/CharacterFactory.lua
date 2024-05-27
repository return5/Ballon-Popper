local config = require('config.Config')
local MovObj = require('model.objects.MovObj')
local dir = require('config.Dir')
local random = love.math.random
local newImg = love.graphics.newImage

local CharacterFactory = {}
CharacterFactory.__index = CharacterFactory

_ENV = CharacterFactory

local masterShakeImg = newImg('assets/img/characters/mastershake.png')

function CharacterFactory.generateMasterShake()
	return MovObj:new(random(1,config.width),config.characterStartY - masterShakeImg:getHeight(),0,masterShakeImg,0,config.characterSpeed,dir.LEFT)
end

function CharacterFactory.generateCharacter()
	return CharacterFactory.generateMasterShake(),CharacterFactory.generateMasterShake()
end

return CharacterFactory
