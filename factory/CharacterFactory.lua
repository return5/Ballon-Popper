local config = require('config.Config')
local Character = require('model.Character')
local dir = require('config.Dir')
local HitBox = require('model.HitBox')
local EmptyChar = require('model.EmptyCharacter')
local MasterShake = require('model.MasterShake')
local CharacterChoices = require('config.CharacterChoices')
local random = love.math.random
local newImg = love.graphics.newImage

local CharacterFactory = {}
CharacterFactory.__index = CharacterFactory

_ENV = CharacterFactory

local masterShakeImg = newImg('assets/img/characters/shake.png')
local quinnImg = newImg('assets/img/characters/quinn.png')
local stormyImg = newImg('assets/img/characters/stormy.png')

function CharacterFactory.generateMasterShake(pos)
	local x = random(1,config.width - masterShakeImg:getWidth())
	local y = config.characterStartY - masterShakeImg:getHeight()
	local hitBoxY = y  + (masterShakeImg:getHeight()* .594)
	local hitBoxSize = .129 * masterShakeImg:getWidth()
	local hitBox = HitBox:new(x + 1,hitBoxY,hitBoxSize)
	local hitBox2 = HitBox:new(x + masterShakeImg:getWidth() - hitBoxSize - 1,hitBoxY,hitBoxSize)
	return MasterShake:new(x,y,hitBox,hitBox2,masterShakeImg,0,config.characterSpeed,dir.LEFT,pos)
end

function CharacterFactory.generateQuinn(pos)
	local x = random(1,config.width - quinnImg:getWidth())
	local y = config.characterStartY - quinnImg:getHeight()
	local hitBox = HitBox:new(x + 1,y  + (quinnImg:getHeight()* .228),.124 * quinnImg:getWidth())
	return Character:new(x,y,hitBox,quinnImg,0,config.characterSpeed,dir.LEFT,pos)
end

function CharacterFactory.generateStormy(pos)
	local x = random(1,config.width - stormyImg:getWidth())
	local y = config.characterStartY - stormyImg:getHeight()
	local hitBox = HitBox:new(x + 1,y  + (stormyImg:getHeight()* .228),.124 * stormyImg:getWidth())
	return Character:new(x,y,hitBox,stormyImg,0,config.characterSpeed,dir.LEFT,pos)
end

function CharacterFactory.generateEmpty()
	return EmptyChar:new()
end

function CharacterFactory.generateCharacter(playerChoice,pos)
	if playerChoice == CharacterChoices.MasterShake then
		return CharacterFactory.generateMasterShake(pos)
	elseif playerChoice == CharacterChoices.Quinn then
		return CharacterFactory.generateQuinn(pos)
	elseif playerChoice == CharacterChoices.Stormy then
		return CharacterFactory.generateStormy(pos)
	end
	return CharacterFactory.generateEmpty()
end

return CharacterFactory
