local def = require('define')

local this = {}


----TRANSITION 1--------------------------------------------------------------
this.screenFadeout = {}
this.screenFadeout.alpha = 1

function this.screenFadeout.update(dt)
	if this.screenFadeout.alpha > 0 then
		this.screenFadeout.alpha = this.screenFadeout.alpha - (60*dt) / 200
 	else
		this.screenFadeout.alpha = 0
	end
end

function this.screenFadeout.draw()
	love.graphics.setColor(0,0,0, this.screenFadeout.alpha )
	love.graphics.rectangle('fill', 0, 0, def.SCREEN_WIDTH, def.SCREEN_HEIGHT)
	love.graphics.setColor(1,1,1,1)
end
-----------------------------------------------------------------------------


----TRANSITION 2-------------------------------------------------------------
this.screenFadein = {}
this.screenFadein.alpha = 0

function this.screenFadein.update(dt)
	if this.screenFadein.alpha < 1 then
		this.screenFadein.alpha = this.screenFadein.alpha + (60*dt) / 200
 	else
		this.screenFadein.alpha = 1
	end
end

function this.screenFadein.draw()
	if this.screenFadein.alpha < 1 then
		love.graphics.setColor(0,0,0, this.screenFadein.alpha )
		love.graphics.rectangle('fill', 0, 0, def.SCREEN_WIDTH, def.SCREEN_HEIGHT)
		love.graphics.setColor(1,1,1,1)
	end
end
----------------------------------------------------------------------------


----MUSIC TRANSITION 1------------------------------------------------------
this.musicFadeout = {}

function this.musicFadeout.update(dt, pTheme, pMaxVol)
	local vol = pTheme:getVolume()
	if vol < pMaxVol then
		vol = vol + (60*dt) / 600
	else
		vol = pMaxVol
	end
	pTheme:setVolume(vol)
end
----------------------------------------------------------------------------

return this

