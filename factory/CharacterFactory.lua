local config = require('config.Config')
local MovObj = require('model.objects.MovObj')
local dir = require('config.Dir')
local HitBox = require('model.HitBox')
local random = love.math.random
local newImg = love.graphics.newImage

local CharacterFactory = {}
CharacterFactory.__index = CharacterFactory

_ENV = CharacterFactory

local masterShakeImg = newImg('assets/img/characters/mastershake.png')

function CharacterFactory.generateMasterShake()
	local x = random(1,config.width)
	local y = config.characterStartY - masterShakeImg:getHeight()
	local hitBox = HitBox:new(x,y  + (masterShakeImg:getHeight()* .594),.139 * masterShakeImg:getWidth())
	return MovObj:new(x,y,hitBox,masterShakeImg,0,config.characterSpeed,dir.LEFT)
end

function CharacterFactory.generateCharacter()
	return CharacterFactory.generateMasterShake(),CharacterFactory.generateMasterShake()
end

return CharacterFactory
