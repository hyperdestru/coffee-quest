local menu = {}

local def = require('define')

menu.theme = nil
menu.img = nil

function menu.Load()
	menu.theme = love.audio.newSource('sounds/cq-theme-menu.mp3', 'stream')
	menu.theme:isLooping(true)
	menu.img = love.graphics.newImage('images/cq-menu.png')
end

function menu.Update(dt)
	menu.theme:play()
end

function menu.Draw()
	love.graphics.draw(menu.img)
end

function menu.Keypressed(key)
	if key == 'space' then
		menu.theme:stop()
		def.current_screen = 'overworld'
	end
end

return menu