local util = require('util')

local this = {}

function this.create(p_id, p_img, p_table)
	local scene = {}

	scene.id = p_id

	if p_img == nil then
		scene.background = nil
	else
		scene.background = love.graphics.newImage('images/'..p_img)
	end

	scene.append_text = function(p_string)
		scene.text = p_string
	end

	scene.append_object = function(p_id, p_img, p_zone)
		scene.object = {}
		scene.object.id = p_id
		scene.object.img = p_img
		scene.object.zone = p_zone
	end

	scene.append_character = function(p_id, p_img, p_sound)
		scene.character = {}
		scene.character.id = p_id
		scene.character.img = p_img
		scene.character.sound = p_sound
	end

	scene.update = function(dt)
	end

	scene.draw = function()
		if scene.background ~= nil then
			love.graphics.draw(scene.background)
		end

		if scene.object ~= nil then
			love.graphics.draw(scene.object.img)
		end

		if scene.character ~= nil then
			love.graphics.draw(scene.character.img)
		end
	end

	table.insert(p_table, scene)
	return scene
end

return this