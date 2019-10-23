local this = {}

function this.music_fade(p_music, dt)
	local volume = p_music:getVolume()
	local max_volume = 1
	if volume < max_volume then
		volume = volume + dt/10
	else
		volume = 1
	end
	p_music:setVolume(volume)
end

return this