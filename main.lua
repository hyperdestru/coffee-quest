local def = require('define')
local overworld = require('overworld')
local menu = require('menu')
local city = require('city')

function love.load()
	def.current_screen = 'menu'

	menu.load()
	overworld.load()
	city.load()

end

function love.update(dt)

	if def.current_screen == 'menu' then
		menu.update(dt)
	elseif def.current_screen == 'overworld' then 
		overworld.update(dt) 
	elseif def.current_screen == 'city' then
		city.update(dt)
	end

end

function love.draw()

	if def.current_screen == 'menu' then
		menu.draw()
	elseif def.current_screen == 'overworld' then
		overworld.draw()
	elseif def.current_screen == 'city' then
		city.draw()
	end

end

function love.keypressed(key)

	if def.current_screen == 'menu' then
		menu.keypressed(key)
	end

end

