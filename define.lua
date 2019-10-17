local this = {}

this.SCREEN_WIDTH = love.graphics.getWidth()
this.SCREEN_HEIGHT = love.graphics.getHeight()

this.color = {}
this.color.white = {1,1,1}
this.color.black = {0,0,0}
this.color.grey = {0.5,0.5,0.5}
this.color.red = {1,0,0}
this.color.green = {0,1,0}
this.color.blue = {0,0,1}
this.color.brown = {102/255, 51/255, 0}
this.color.startrek_blue = {101/255,117/255,166/255}

this.current_scene = ''

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

function this.create_screen(p_id, p_img, p_text, p_table)
	local screen = {}
	screen.id = p_id
	screen.img = love.graphics.newImage('images/'..p_img)
	screen.text = p_text

	screen.append_object = function(p_id, p_img, p_zone)
		screen.obj = {}
		screen.obj.id = p_obj_id
		screen.obj.img = love.graphics.newImage('images/'..p_img)		
		screen.obj.zone = p_zone
	end

	screen.append_character = function(p_id, p_img)
		screen.character = {}
		screen.character.id = p_id
		screen.character.img = love.graphics.newImage('images/'..p_img)
	end

	screen.draw = function()
		love.graphics.draw(screen.img)

		if screen.obj ~= nil then
			love.graphics.draw(screen.obj.img)
		end

		if screen.character ~= nil then
			love.graphics.draw(screen.character.img)
		end
	end

	table.insert(p_table, screen)
	return screen
end

return this