local tick = require('libs.tick')
local AssetFactory = require('factory.AssetFactory')
local remove = table.remove
local file = io.open("mainBalloons.text","w+")
local balloons,character,background = AssetFactory.generateAssets()

function love.draw()
	--background:print()
	file:write("size of balloons: " , #balloons,"\n")
	for i=1,#balloons,1 do
		file:write("printing balloon ",i,"\n")
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


