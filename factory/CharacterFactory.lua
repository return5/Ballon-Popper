local config = require('config.Config')
local MovObj = require('model.objects.MovObj')
local dir = require('config.Dir')
local HitBox = require('model.HitBox')
local EmptyChar = require('model.EmptyCharacter')
local MasterShake = require('model.MasterShake')
local random = love.math.random
local newImg = love.graphics.newImage

local CharacterFactory = {}
CharacterFactory.__index = CharacterFactory

_ENV = CharacterFactory

local masterShakeImg = newImg('assets/img/characters/shake.png')
local quinnImg = newImg('assets/img/characters/quinn.png')
local stormyImg = newImg('assets/img/characters/stormy.png')

function CharacterFactory.generateMasterShake()
	local x = random(1,config.width - masterShakeImg:getWidth())
	local y = config.characterStartY - masterShakeImg:getHeight()
	local hitBoxY = y  + (masterShakeImg:getHeight()* .594)
	local hitBoxSize = .129 * masterShakeImg:getWidth()
	local hitBox = HitBox:new(x + 1,hitBoxY,hitBoxSize)
	local hitBox2 = HitBox:new(x + masterShakeImg:getWidth() - hitBoxSize - 1,hitBoxY,hitBoxSize)
	return MasterShake:new(x,y,hitBox,hitBox2,masterShakeImg,0,config.characterSpeed,dir.LEFT)
end

function CharacterFactory.generateQuinn()
	local x = random(1,config.width - quinnImg:getWidth())
	local y = config.characterStartY - quinnImg:getHeight()
	local hitBox = HitBox:new(x + 1,y  + (quinnImg:getHeight()* .228),.124 * quinnImg:getWidth())
	return MovObj:new(x,y,hitBox,quinnImg,0,config.characterSpeed,dir.LEFT)
end

function CharacterFactory.generateStormy()
	local x = random(1,config.width - stormyImg:getWidth())
	local y = config.characterStartY - stormyImg:getHeight()
	local hitBox = HitBox:new(x + 1,y  + (stormyImg:getHeight()* .228),.124 * stormyImg:getWidth())
	return MovObj:new(x,y,hitBox,stormyImg,0,config.characterSpeed,dir.LEFT)
end

function CharacterFactory.generateCharacter(playerChoice)
	if playerChoice == "shake" then
		return CharacterFactory.generateMasterShake()
	elseif playerChoice == "quinn" then
		return CharacterFactory.generateQuinn()
	elseif playerChoice == "stormy" then
		return CharacterFactory.generateStormy()
	end
	return EmptyChar:new()
end

return CharacterFactory
