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
	text.font_size = 18
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

function this.create_act(p_id, p_img, p_string, p_table)
	local act = {}
	act.id = p_id
	if p_img ~= nil then 
		act.bg = love.graphics.newImage('images/'..p_img)
	end

	act.append_object = function(p_id, p_img, p_zone)
		act.obj = {}
		act.obj.id = p_obj_id
		act.obj.img = love.graphics.newImage('images/'..p_img)		
		act.obj.zone = p_zone
	end

	act.append_character = function(p_id, p_img)
		act.character = {}
		act.character.id = p_id
		act.character.img = love.graphics.newImage('images/'..p_img)
	end

	act.draw = function()
		if act.bg ~= nil then
			love.graphics.draw(act.bg)
		else
			love.graphics.setColor(util.color.black)
			love.graphics.rectangle('fill', 0, 0, util.SCREEN_WIDTH, util.SCREEN_HEIGHT)
			love.graphics.setColor(1,1,1)
		end

		if act.obj ~= nil then
			love.graphics.draw(act.obj.img)
		end

		if act.character ~= nil then
			love.graphics.draw(act.character.img)
		end
	end

	table.insert(p_table, act)
	return act
end

return this