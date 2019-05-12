--[[
	COFFEE QUEST
	Adventure 2D game - Go look for the truth about the untold legend of the never ending coffee bean. 
	Made with : Love2D
	Authors :
		Thomas aka Teauma : graphics, writting
		Alex aka Grobato aka Xael : sound design, music
		Gael aka Hyperdestru : programming
--]]

local def = require('define')
local overworld = require('overworld')
local menu = require('menu')

function love.load()

	def.current_screen = 'menu'

	menu.Load()
	overworld.Load()

end

function love.update(dt)

	if def.current_screen == 'menu' then
		menu.Update(dt)
	elseif def.current_screen == 'overworld' then 
		overworld.Update(dt) 
	end

end

function love.draw()

	if def.current_screen == 'menu' then
		menu.Draw()
	elseif def.current_screen == 'overworld' then
		overworld.Draw()
	end

end

function love.keypressed(key)

	if def.current_screen == 'menu' then
		menu.Keypressed(key)
	end

end

