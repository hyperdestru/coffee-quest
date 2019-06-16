local def = require('define')

local this = {}

this.screenFadeout = {}
this.screenAlpha = 1

function this.screenFadeout.Update(dt)
	if this.screenAlpha > 0 then
		this.screenAlpha = this.screenAlpha - (60*dt) / 200
 	else
		this.screenAlpha = 0
	end
end

function this.screenFadeout.Draw()
	love.graphics.setColor(0,0,0, this.screenAlpha )
	love.graphics.rectangle('fill', 0, 0, def.SCREEN_WIDTH, def.SCREEN_HEIGHT)
	love.graphics.setColor(1,1,1,1)
end

function this.musicFadeout.Update(dt, pTheme, pMaxVol)
	local vol = pTheme:getVolume()
	if vol < pMaxVol then
		vol = vol + (60*dt) / 600
	else
		vol = pMaxVol
	end
	pTheme:setVolume(vol)
end

return this

