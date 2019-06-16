local def = require('define')
local transition = require('transitions')

local this = {}

function this.Load()
end

function this.Update(dt)
	transition.screenFadeout.Update(dt)
end

function this.Draw()
	love.graphics.setBackgroundColor(62/255,92/255,92/255)
	love.graphics.print("THE CITY. Coming soon...", def.SCREEN_WIDTH/4, def.SCREEN_HEIGHT/2,0,3,3)
	transition.screenFadeout.Draw()
end

return this