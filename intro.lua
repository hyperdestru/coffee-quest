local def = require('define')

local this = {}

function this.load()
	this.tscreens = {}
	def.create_screen('intro-1', 'scene-intro/cq-intro-screen-1', this.tscreens)
	----FADEOUT
	this.screen_alpha = 1
end

function this.update(dt)
	----FADEOUT
	if this.screen_alpha > 0 then
		this.screen_alpha = this.screen_alpha - (60*dt) / 200
	else 
		this.screen_alpha = 0
	end
end

function this.draw()
	def.draw_screen(this.tscreens)

	----FADEOUT
	love.graphics.setColor(0,0,0, this.screen_alpha)
	love.graphics.rectangle('fill', 0, 0, def.SCREEN_WIDTH, def.SCREEN_HEIGHT)
	love.graphics.setColor(1,1,1,1)
end

function this.keypressed(key)
	if key == 'space' then
		def.current_screen = 'overworld'
	end
end

return this