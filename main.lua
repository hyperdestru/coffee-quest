--[[
	COFFEE QUEST
	Adventure 2D game - Go look for the truth about the untold legend of the never ending coffee bean. 
	Made with : Love2D
	Authors :
		Thomas aka Teauma : graphics, writting
		Alex aka Grobato aka Xael : sound design, music
		Gael aka Hyperdestru : programming
--]]


function love.load()

	overworld = require('overworld')
	menu = require('menu')

	__currentscreen__ = 'menu'

	menu.Load()
	overworld.Load()

end

function love.update(dt)

	if __currentscreen__ == 'overworld' then 
		overworld.Update(dt) 
	end

end

function love.draw()

	if __currentscreen__ == 'menu' then
		menu.Draw()
	elseif __currentscreen__ == 'overworld' then
		overworld.Draw()
	end

end

function love.keypressed(key)

	if __currentscreen__ == 'menu' then
		menu.Keypressed(key)
	end

end

