local util = require('util')
local gui = require('gui')

local this = {}

function this.init(p_id, p_img, p_table)
	gui.load()

	local scene = {}

	scene.id = p_id

	if p_img == nil then
		scene.background = nil
	else
		scene.background = love.graphics.newImage('images/'..p_img)
	end

	function scene.append_text(p_text)
		scene.text = {}
		scene.text.content = p_text
		scene.text.padding = 10
		scene.text.x = gui.main_textbox.x + scene.text.padding
		scene.text.y = gui.main_textbox.y + scene.text.padding
		scene.text.limit = gui.main_textbox.w - scene.text.padding
	end

	function scene.append_object(p_id, p_img, p_zone)
		scene.object = {}
		scene.object.id = p_id
		scene.object.img = p_img
		scene.object.zone = p_zone
	end

	function scene.append_character(p_id, p_img, p_sound)
		scene.character = {}
		scene.character.id = p_id
		scene.character.img = p_img
		scene.character.sound = p_sound
	end

	function scene.update(dt)
		gui.update(dt)
	end

	function scene.draw ()
		if scene.background ~= nil then
			love.graphics.draw(scene.background)
		end

		if scene.object ~= nil then
			love.graphics.draw(scene.object.img)
		end

		if scene.character ~= nil then
			love.graphics.draw(scene.character.img)
		end

		gui.draw()

		if scene.text ~= nil then
			love.graphics.setColor(util.color.black)
			love.graphics.setFont(util.font.vera_sans)
			love.graphics.printf(scene.text.content, scene.text.x, scene.text.y, scene.text.limit)
			love.graphics.setColor(1,1,1)
		end

	end

	table.insert(p_table, scene)

	return scene
end

return this