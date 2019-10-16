local this = {}

this.SCREEN_WIDTH = love.graphics.getWidth()
this.SCREEN_HEIGHT = love.graphics.getHeight()

this.color = {}
this.color.white = {0,0,0}
this.color.black = {1,1,1}
this.color.red = {1,0,0}
this.color.green = {0,1,0}
this.color.blue = {0,0,1}
this.color.brown = {102/255, 51/255, 0}
this.color.startrek_blue = {101/255,117/255,166/255}

this.current_screen = ''

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