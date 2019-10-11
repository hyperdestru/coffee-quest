local def = require('define')

local this = {}

this.gui = require('gui')

function this.load()
	this.gui.load()

	this.tscreens = {}

	def.create_screen('intro-1', 'images/scene-intro/kitchen.png', this.tscreens)

	----FADEOUT
	this.screen_alpha = 1
	----
end

function this.update(dt)
	this.gui.update(dt)

	----FADEOUT
	if this.screen_alpha > 0 then
		this.screen_alpha = this.screen_alpha - (60*dt) / 200
	else 
		this.screen_alpha = 0
	end
	----
end

function this.draw()
	def.draw_screen(this.tscreens)

	this.gui.draw()

	----FADEOUT
	love.graphics.setColor(0,0,0, this.screen_alpha)
	love.graphics.rectangle('fill', 0, 0, def.SCREEN_WIDTH, def.SCREEN_HEIGHT)
	love.graphics.setColor(1,1,1,1)
	----
end

function this.mousepressed(x, y, button, istouch)
	if button == 1 then
		def.create_screen('intro-2', 'images/scene-intro/living-room.png', this.tscreens)
	end
end

return this