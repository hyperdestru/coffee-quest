local def = require('define')

local this = {}

this.fadeout = {}
local is_fading = true
local alpha = 1

function this.fadeout.update(dt)

	if is_fading == true then

		alpha = alpha - (60*dt) / 200

		if alpha <= 0 then 
			is_fading = false 
		end
	end

end

function this.fadeout.draw()
	love.graphics.setColor(0,0,0, alpha)
	love.graphics.rectangle('fill', 0, 0, def.SCREEN_WIDTH, def.SCREEN_HEIGHT)
	love.graphics.setColor(1,1,1,1)
end


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

return this

