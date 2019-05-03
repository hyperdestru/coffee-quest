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


overworld = require('overworld')

function love.load()
	overworld.Load()
end

function love.update(dt)
	overworld.Update(dt)
end

function love.draw()
	overworld.Draw()
end

