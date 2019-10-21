local gui = require('gui')
local util = require('util')

local this = {}

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

function this.create_text(p_string, p_table)
	local text = {}
	text.body = p_string
	text.body = p_string
	text.margin = 8
	text.color = util.color.black
	text.font_size = 25
	text.font = love.graphics.newFont('fonts/font-vera-sans/vera.ttf', text.font_size)
	text.x = gui.main_textbox.x + text.margin
	text.y = gui.main_textbox.y + text.margin

	text.draw = function()
		love.graphics.setColor(text.color)
		love.graphics.setFont(text.font)
		love.graphics.print(text.body, text.x, text.y)
		love.graphics.setColor(1,1,1)
	end

	table.insert(p_table, text)
	return text
end

function this.create_screen(p_id, p_img, p_string, p_table)
	local screen = {}
	screen.id = p_id
	screen.img = love.graphics.newImage('images/'..p_img)

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