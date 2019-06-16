local def = require('define')

local this = {}

this.theme = nil
this.img = nil

function this.Load()
	this.theme = love.audio.newSource('sounds/cq-theme-menu.mp3', 'stream')
	this.theme:isLooping(true)
	this.img = love.graphics.newImage('images/cq-menu.png')
end

function this.Update(dt)
	this.theme:play()
end

function this.Draw()
	love.graphics.draw(this.img)
end

function this.Keypressed(key)
	if key == 'space' then
		this.theme:stop()
		def.current_screen = 'overworld'
	end
end

return this