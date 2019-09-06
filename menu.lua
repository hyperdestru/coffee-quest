local def = require('define')

local this = {}

this.theme = nil
this.img = nil

function this.load()
	this.theme = love.audio.newSource('sounds/cq-theme-menu.mp3', 'stream')
	this.theme:isLooping(true)
	this.img = love.graphics.newImage('images/menu/cq-menu.png')
end

function this.update(dt)
	this.theme:play()
end

function this.draw()
	love.graphics.draw(this.img)
end

function this.keypressed(key)
	if key == 'space' then
		this.theme:stop()
		def.current_screen = 'intro'
	end
end

return this