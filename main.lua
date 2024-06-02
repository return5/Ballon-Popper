local tick = require('libs.tick')
local AssetFactory = require('factory.AssetFactory')
local config = require("config.Config")
local PlayerChoices = require('model.PlayerChoices')
local remove = table.remove
local isScancodeDown = love.keyboard.isScancodeDown
local pairs = pairs

love.window.setMode(config.width,config.height)
local balloons,background,character1,character2,pretzel,countDown

local function drawDuringGamePlay()
	love.graphics.draw(background,0,0)
	countDown:print()
	pretzel[1]:print()
	for i=1,#balloons,1 do
		balloons[i]:print()
	end
	character1:print()
	character2:print()
	character1:printScore()
	character2:printScore()
end

local function drawDuringPlayerSelection()
	PlayerChoices.print()
end


local function drawDuringGameOVer()
	drawDuringGamePlay()

end

local playerOneScancodes = {}

local playerTwoScancodes = {}

local function checkScanCodeForPlayer(dt,scanCodes,player)
	for scancode,func in pairs(scanCodes) do
		if isScancodeDown(scancode) then
			return func(player,dt)
		end
	end
end

local function checkScanCode(dt)
	checkScanCodeForPlayer(dt,playerOneScancodes,character1)
	checkScanCodeForPlayer(dt,playerTwoScancodes,character2)
end

local function popBalloon(i,character)
	character:increaseScore(balloons[i])
	balloons[i]:playSound()
	remove(balloons,i)
end

local function pretzelFunction(dt)
	pretzel[1]:move(dt)
	if character1:checkCollision(pretzel[1]) then

	elseif character2:checkCollision(pretzel[1]) then

	end
end

local function checkBalloonCollision(i,dt)
	if not balloons[i]:update(dt) then
		remove(balloons,i)
	elseif character1:checkCollision(balloons[i]) then
		popBalloon(i,character1)
	elseif character2:checkCollision(balloons[i]) then
		popBalloon(i,character2)
	end
end

local function updateDuringGameOVer(dt)

end

local function setGameOVer()

end

local function updateDuringPlay(dt)
	tick.update(dt)
	checkScanCode(dt)
	pretzelFunction(dt)
	for i=#balloons,1,-1 do
		checkBalloonCollision(i,dt)
	end
	if countDown.time <= 0 then
		setGameOVer()
	end
end

local function setGamePlay(playerOneChoice,playerTwoChoice)
	balloons,background,character1,character2,pretzel,countDown = AssetFactory.generateAssets(playerOneChoice,playerTwoChoice)
	love.update = updateDuringPlay
	love.draw = drawDuringGamePlay
	playerOneScancodes = {
		w = character1.moveUp,
		s = character1.moveDown,
		a = character1.moveLeft,
		d = character1.moveRight,
	}

	playerTwoScancodes = {
		up = character2.moveUp,
		down = character2.moveDown,
		left = character2.moveLeft,
		right = character2.moveRight
	}
end

local function updateDuringPlayerSelection()
	local selections = PlayerChoices.checkScanCodes()
	if #selections == 2 then
		setGamePlay(selections[1],selections[2])
	end
end

local function setUpNewGame()
	love.update = updateDuringPlayerSelection
	love.draw = drawDuringPlayerSelection
end

setUpNewGame()
