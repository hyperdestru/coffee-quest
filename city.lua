local def = require('define')

local this = {}
this.alpha = 1

function this.Load()
end

function this.Update(dt)
	if this.alpha > 0 then
		this.alpha = this.alpha - (60*dt) / 200
 	else
		this.alpha = 0
	end
end

function this.Draw()
	love.graphics.setBackgroundColor(62/255,92/255,92/255)
	love.graphics.print("THE CITY. Coming soon...", def.SCREEN_WIDTH/4, def.SCREEN_HEIGHT/2,0,3,3)

	----DRAW TRANSITIONS
	love.graphics.setColor(0,0,0, this.alpha)
	love.graphics.rectangle('fill', 0, 0, def.SCREEN_WIDTH, def.SCREEN_HEIGHT)
	love.graphics.setColor(1,1,1,1)
	----
end

return this