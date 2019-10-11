local def = require('define')
local menu = require('menu')
local overworld = require('overworld')
local intro = require('intro')

function love.load()

	def.current_screen = 'menu'

	menu.load()
	overworld.load()
	intro.load()
	
end

function love.update(dt)

	if def.current_screen == 'menu' then
		menu.update(dt)
	elseif def.current_screen == 'overworld' then 
		overworld.update(dt) 
	elseif def.current_screen == 'intro' then
		intro.update(dt)
	end

end

function love.draw()

	if def.current_screen == 'menu' then
		menu.draw()
	elseif def.current_screen == 'overworld' then
		overworld.draw()
	elseif def.current_screen == 'intro' then
		intro.draw()
	end

end

function love.keypressed(key)

	if def.current_screen == 'menu' then
		menu.keypressed(key)
	end

end

function love.mousepressed(x, y, button, istouch)

	if def.current_screen == 'intro' then
		intro.mousepressed(x, y, button, istouch)
	end

end


