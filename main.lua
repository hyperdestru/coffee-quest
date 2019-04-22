--[[
	COFFEE QUEST
	Adventure 2D game - Go look for the truth about the untold legend of the never ending coffee bean. 
	Made with : Love2D
	Platforms : Linux, Windows.
	Authors :
		Thomas aka Teauma : graphics, writting
		Alex aka Grobato aka Xael : sound design, music
		Gael aka Hyperdestru : programming
--]]


Overworld = require('overworld')

function love.load()
	Overworld.Load()
end

function love.update(dt)
	Overworld.Update(dt)
end

function love.draw()
	Overworld.Draw()
end

