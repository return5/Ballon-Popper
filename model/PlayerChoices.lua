local CharacterChoices = require('config.CharacterChoices')
local config = require('config.Config')
local pairs = pairs
local setFont = love.graphics.setFont
local newFont = love.graphics.newFont
local printF = love.graphics.printf
local isScanCodeDown = love.keyboard.isScancodeDown
local time = love.timer.getTime

local PlayerChoices = {}
PlayerChoices.__index = PlayerChoices

_ENV = PlayerChoices

local choices = {}
for _,v in pairs(CharacterChoices) do
	choices[#choices + 1] = v
end

local title = "Please Select The Number for the Character You Wish To Play As:"
local playerOne = "Player One "
local playerTwo = "Player Two "
local textFont = newFont(15)
local textLimit = textFont:getWidth(CharacterChoices.MasterShake) + 2
local fontHeight = textFont:getHeight("A")
local startY = (config.height / 2)  - ((fontHeight * #choices) / 2)
local startX = (config.width / 2) - (textFont:getWidth(CharacterChoices.MasterShake) / 2)
local textX = (startX - textFont:getWidth(#choices)) - 8
local titleY = (startY - textFont:getHeight(title)) - 5
local titles = { playerOne .. title, playerTwo .. title }
local selection = 1
local selections = {}
local playerChoice = 1
local debounceTimer = time()

setFont(textFont)

local function printChoice(i)
	local y = startY + ((i - 1) * (fontHeight + 5))
	printF(i,textX,y,100,"left")
	printF(choices[i],startX,y,textLimit,"left")
end

function PlayerChoices.print()
	printF(titles[selection],0,titleY,config.width,"center")
	for i=1,#choices,1 do
		printChoice(i)
	end
end

function PlayerChoices.checkScanCodes()
	if isScanCodeDown("return") and time() - debounceTimer > 0.2 then
		selections[#selections + 1] = choices[playerChoice]
		selection = selection + 1
		debounceTimer = time()
	end
	for scanCode in pairs(choices) do
		if isScanCodeDown(scanCode) then
			playerChoice = scanCode
		end

	end
	return selections
end

return PlayerChoices
