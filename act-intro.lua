local scene = require('scene')

local this = {}

function this.load()
	this.t_scenes = {}

	scene.init('VOID', nil, this.t_scenes)
	this.t_scenes[1].append_text("This is the void")

	scene.init('KITCHEN', 'act-intro/kitchen.png', this.t_scenes)
	this.t_scenes[2].append_text("This is the kitchen")

	scene.init('COFFEE_SHOP', 'act-intro/coffee-shop.png', this.t_scenes)
	this.t_scenes[3].append_text("This is the shop")

	scene.init('LIVING_ROOM', 'act-intro/living-room.png', this.t_scenes)
	this.t_scenes[4].append_text("This is the living room")

	this.scene_position = 1
	this.scene_position_max = #this.t_scenes
end

function this.update(dt)
	this.t_scenes[this.scene_position].update(dt)
end

function this.draw()
	this.t_scenes[this.scene_position].draw()
end

function this.keypressed(key)
	if key == 'return' and this.scene_position < this.scene_position_max then
		this.scene_position = this.scene_position + 1
	end
end

function this.mousepressed(x, y, button, istouch)
end

return this