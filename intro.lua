local transition = require('transitions')
local def = require('define')

local this = {}

function this.load()
	this.tscreens = {}
	def.create_screen('intro-1', 'scene-intro/cq-intro-screen-1', this.tscreens)
end

function this.update(dt)
	transition.fadeout.update(dt)
end

function this.draw()
	def.draw_screen(this.tscreens)
	transition.fadeout.draw()
end

function this.keypressed(key)
	if key == 'space' then
		def.current_screen = 'overworld'
	end
end

return this