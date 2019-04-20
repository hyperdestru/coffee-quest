--[[
	COFFEE QUEST
	Adventure 2D game - Go look for the truth about the untold legend of the never ending coffee bean. 
	Made with : Love2D
	Platforms : Linux, Windows.
	Authors :
		Gael aka Hyperdestru : programming, game design.
		Thomas aka Teauma : graphics, writting, game design.
		Alex aka Grobato aka Xael : sound design, music, game design.
	Licence :
	2019 ©
--]]

io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")

Game = require('game')

function love.load()
	Game.Load()
end

function love.update(dt)
end

function love.draw()
	Game.Draw()
end

