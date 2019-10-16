local def = require('define')

local title_screen = require('title-screen')
local overworld = require('overworld')
local scene_intro = require('scene-intro')

function love.load()

	def.current_screen = 'TITLE_SCREEN'

	title_screen.load()
	overworld.load()
	scene_intro.load()
	
end

function love.update(dt)

	if def.current_screen == 'TITLE_SCREEN' then
		title_screen.update(dt)
	elseif def.current_screen == 'OVERWORLD' then 
		overworld.update(dt) 
	elseif def.current_screen == 'SCENE_INTRO' then
		scene_intro.update(dt)
	end

end

function love.draw()

	if def.current_screen == 'TITLE_SCREEN' then
		title_screen.draw()
	elseif def.current_screen == 'OVERWORLD' then
		overworld.draw()
	elseif def.current_screen == 'SCENE_INTRO' then
		scene_intro.draw()
	end

end

function love.keypressed(key)

	if def.current_screen == 'TITLE_SCREEN' then
		title_screen.keypressed(key)
	elseif def.current_screen == 'SCENE_INTRO' then
		scene_intro.keypressed(key)
	end

end

function love.mousepressed(x, y, button, istouch)

	if def.current_screen == 'SCENE_INTRO' then
		scene_intro.mousepressed(x, y, button, istouch)
	end

end


