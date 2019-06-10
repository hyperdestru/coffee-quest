local def = require('define')
local overworld = require('overworld')
local menu = require('menu')
local city = require('city')

function love.load()

	def.current_screen = 'menu'

	menu.Load()
	overworld.Load()
	city.Load()

end

function love.update(dt)

	if def.current_screen == 'menu' then
		menu.Update(dt)
	elseif def.current_screen == 'overworld' then 
		overworld.Update(dt) 
	elseif def.current_screen == 'city' then
		city.Update(dt)
	end

end

function love.draw()

	if def.current_screen == 'menu' then
		menu.Draw()
	elseif def.current_screen == 'overworld' then
		overworld.Draw()
	elseif def.current_screen == 'city' then
		city.Draw()
	end

end

function love.keypressed(key)

	if def.current_screen == 'menu' then
		menu.Keypressed(key)
	end

end

