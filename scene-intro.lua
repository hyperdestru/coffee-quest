local def = require('define')

local this = {}

this.gui = require('gui')

function this.load()
	this.t_screens = {}

	this.gui.load()

	def.create_screen(
		'KITCHEN',
		'scene-intro/kitchen.png',
		"this is the kitchen",
		this.t_screens
	)

	def.create_screen(
		'LIVING_ROOM',
		'scene-intro/living-room.png',
		"this is the living room",
		this.t_screens
	)

	def.create_screen(
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

----For testing purposes
function this.keypressed(key)
	if key == 'o' then
		def.current_scene = 'OVERWORLD'
	end
end

return this