local scene = require('scene')

local this = {}

this.gui = require('gui')

function this.load()
	this.gui.load()

	this.t_scenes = {}
	scene.create('VOID', nil, this.t_scenes)
	scene.create('KITCHEN', 'act-intro/kitchen.png', this.t_scenes)
	scene.create('COFFEE_SHOP', 'act-intro/coffee-shop.png', this.t_scenes)
	scene.create('LIVING_ROOM', 'act-intro/living-room.png', this.t_scenes)
	this.scene_position = 1
	this.scene_position_max = #this.t_scenes
end

function this.update(dt)
	this.gui.update(dt)
end

function this.draw()
	this.t_scenes[this.scene_position].draw()
	this.gui.draw()
end

function this.keypressed(key)
	if key == 'return' and this.scene_position < this.scene_position_max then
		this.scene_position = this.scene_position + 1
	end
end

return this