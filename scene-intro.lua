local def = require('define')

local this = {}

this.gui = require('gui')

function this.create_screen(p_id, p_img, p_text, p_table)
	local screen = {}
	screen.id = p_id
	screen.img = love.graphics.newImage('images/'..p_img)
	screen.text = p_text

	screen.append_object = function(p_id, p_img)
		screen.obj = {}
		screen.obj.id = p_obj_id
		screen.obj.img = love.graphics.newImage('images/'..p_img)		
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

function this.load()
	this.t_screens = {}

	this.gui.load()

	this.create_screen(
		'KITCHEN',
		'scene-intro/kitchen.png',
		"this is the kitchen",
		this.t_screens
	)

	this.create_screen(
		'LIVING_ROOM',
		'scene-intro/living-room.png',
		"this is the living room",
		this.t_screens
	)

	this.create_screen(
		'COFFEE_SHOP',
		'scene-intro/coffee-shop.png',
		"this is the coffee shop",
		this.t_screens
	)

	this.draw_index = 1
	this.draw_index_max = #this.t_screens
end

function this.update(dt)
	this.gui.update(dt)
end

function this.draw()
	this.t_screens[this.draw_index].draw()
	this.gui.draw()
end

function this.mousepressed(x, y, button, istouch)
	if button == 1 and this.draw_index < this.draw_index_max then
		this.draw_index = this.draw_index + 1
	end
end

function this.keypressed(key)
	if key == 'o' then
		def.current_screen = 'OVERWORLD'
	end
end

return this