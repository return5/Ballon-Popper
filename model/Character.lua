local MovObj = require('model.objects.MovObj')
local config = require("config.Config")

local setmetatable = setmetatable
local printF = love.graphics.printf
local getColor = love.graphics.getColor
local setColor = love.graphics.setColor
local newFont = love.graphics.newFont
local setFont = love.graphics.setFont
local getFont = love.graphics.getFont

local Character = {}
Character.__index = Character
setmetatable(Character,MovObj)

_ENV = Character

local defaultFont = getFont()
local textFont = newFont(25)
local scoreLimit = textFont:getWidth(1000000)
local textX = 10
local red,green,blue = getColor()
local scoreX = (config.width - scoreLimit) - 10

function Character:printScore()
	setFont(textFont)
	setColor(1,0.976,0.024)
	printF(self.scoreText,textX,self.textY,self.textLimit,"left")
	printF(self.score,scoreX,self.textY,scoreLimit,"right")
	setFont(defaultFont)
	setColor(red,green,blue)
end

function Character:new(x,y,hitBox,img,rot,speed,dir,pos)
	local character = setmetatable(MovObj:new(x,y,hitBox,img,rot,speed,dir),self)
	character.textY = 10 + (textFont:getHeight("P") * pos) + (10 * pos)
	character.scoreText = "PLAYER " .. (pos == 0 and "ONE" or "TWO")
	character.textLimit = textFont:getWidth(character.scoreText) + 2
	return character
end

return Character

