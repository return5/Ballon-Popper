local tick = require('libs.tick')
local AssetFactory = require('factory.AssetFactory')
local remove = table.remove
local balloons,character,background = AssetFactory.generateAssets()

function love.draw()
	--background:print()
	for i=1,#balloons,1 do
		balloons[i]:print()
	end
--	character:print()
end

function love.update(dt)
	tick.update(dt)
	for i=#balloons,1,-1 do
		if not balloons[i]:update(dt) then
			remove(balloons,i)
		end
	end
end


