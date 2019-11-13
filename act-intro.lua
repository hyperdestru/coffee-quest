local scene = require('scene')

local this = {}

this.gui = require('gui')
this.text = require('text')

function this.load()
	this.scene_position = 1
	this.text_position = 1
	this.t_scenes = {}

	this.gui.load()

	scene.create('VOID', nil, this.t_scenes)
	--What the fuck is that ? way toooooo complicated
	this.t_scenes[1].append_text(this.text.act_intro.scene_1[this.text_position])

	scene.create('KITCHEN', 'act-intro/kitchen.png', this.t_scenes)
	scene.create('COFFEE_SHOP', 'act-intro/coffee-shop.png', this.t_scenes)
	scene.create('LIVING_ROOM', 'act-intro/living-room.png', this.t_scenes)

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

function this.mousepressed(x, y, button, istouch)
	if button == 1 then this.text_position = this.text_position + 1 end
end

return this