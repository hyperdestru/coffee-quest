local def = require('define')

local tr = {}

tr.alpha_in = 0
tr.alpha_out = 1
tr.volume = 0

function tr.Update(dt, pType, pMusic)

	tr.volume = pMusic:getVolume()

	if pType == 'fadeout' then

		if tr.alpha_out > 0 then
			tr.alpha_out = tr.alpha_out - (60*dt) / 200
	 	else
			tr.alpha_out = 0
		end

		if tr.volume < 1 then
			tr.volume = tr.volume + (60*dt) / 600
		else
			tr.volume = 1
		end
		pMusic:setVolume(tr.volume)

	elseif pType == 'fadein' then

		if tr.alpha_in < 1 then
			tr.alpha_in = tr.alpha_in + (60*dt) / 200
	 	else
			tr.alpha_in = 1
		end

		if volume > 0 then
			tr.volume = tr.volume - (60*dt) / 600
		else
			tr.volume = 0
			pMusic:stop()
		end
	end

end

function tr.Draw(pType)

	if pType == 'fadeout' then
		love.graphics.setColor(0,0,0, tr.alpha_out)
		love.graphics.rectangle('fill', 0, 0, def.SCREEN_WIDTH, def.SCREEN_HEIGHT)
		love.graphics.setColor(1,1,1,1)
	elseif pType == 'fadein' then
		love.graphics.setColor(0,0,0, tr.alpha_in)
		love.graphics.rectangle('fill', 0, 0, def.SCREEN_WIDTH, def.SCREEN_HEIGHT)
		love.graphics.setColor(1,1,1,1)
	end

end

return tr