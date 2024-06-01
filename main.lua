local tick = require('libs.tick')
local AssetFactory = require('factory.AssetFactory')
local config = require("config.Config")
local remove = table.remove
local isScancodeDown = love.keyboard.isScancodeDown
local pairs = pairs

love.window.setMode(config.width,config.height)
local balloons,background,character1,character2 = AssetFactory.generateAssets("shake","stormy")

function love.draw()
	love.graphics.draw(background,0,0)
	for i=1,#balloons,1 do
		balloons[i]:print()
		balloons[i].hitBox:print()
	end
	character1:print()
	character1.hitBox:print()
	character1.hitBox2:print()
	character2:print()
	character2.hitBox:print()
end

local playerOneScancodes = {
	w = character1.moveUp,
	s = character1.moveDown,
	a = character1.moveLeft,
	d = character1.moveRight,
}

local playerTwoScancodes = {
	up = character2.moveUp,
	down = character2.moveDown,
	left = character2.moveLeft,
	right = character2.moveRight
}


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

function love.update(dt)
	tick.update(dt)
	checkScanCode(dt)
	for i=#balloons,1,-1 do
		if not balloons[i]:update(dt) then
			remove(balloons,i)
		elseif character1:checkCollision(balloons[i]) then
			remove(balloons,i)
		elseif character2:checkCollision(balloons[i]) then
			remove(balloons,i)
		end

	end
end

function love.load()
end

