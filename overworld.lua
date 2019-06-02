local def = require('define')
local transition = require('transition')

local world = {}

world.map = {}
world.map.grid = {}
world.map.tilesheet = nil
world.map.tiletextures = {}
world.map.tiletypes = {}

world.map.grid = {
	{ 1,2,3,4,5,6,7,8,9 },
	{ 10,11,12,13,14,15,16,17,18 },
	{ 19,20,21,22,23,24,25,26,27 },
	{ 28,29,30,31,32,33,34,35,36 },
	{ 37,38,39,40,41,42,43,44,45 },
	{ 46,47,48,49,50,51,52,53,54 },
	{ 55,56,57,58,59,60,61,62,63 }
}

world.map.MAP_WIDTH = 9
world.map.MAP_HEIGHT = 7
world.map.TILE_WIDTH = 100
world.map.TILE_HEIGHT = 100

world.theme = nil

local hero = {}

hero.img = nil
hero.line = nil
hero.column = nil

function world.map.isSea(id)
	if world.map.tiletypes[id] == 'sea' then
		return true
	else
		return false
	end
	return false
end

function world.Load()

	world.theme = love.audio.newSource('sounds/cq-theme-overworld.mp3', 'stream')
	world.theme:isLooping(true)
	world.theme:setVolume(0)

	world.map.tilesheet = love.graphics.newImage('images/map-tilesheet-grid.png')
	world.map.tiletextures[0] = nil

	--Reading/cuting each tilesheet tiles one by one : not related to the screen in any way
    local nb_cols = world.map.tilesheet:getWidth() / world.map.TILE_WIDTH
    local nb_lines = world.map.tilesheet:getHeight() / world.map.TILE_HEIGHT
    local l, c = 0, 0
    local id = 1

    for l = 1, nb_lines do
    	for c = 1, nb_cols do
        	world.map.tiletextures[id] = love.graphics.newQuad(
          	(c - 1) * world.map.TILE_WIDTH, 
          	(l - 1) * world.map.TILE_HEIGHT, 
          	world.map.TILE_WIDTH, 
          	world.map.TILE_HEIGHT, 
          	world.map.tilesheet:getWidth(),
          	world.map.tilesheet:getHeight()
        	)
        id = id + 1
      	end
    end
    ----

    local sea = {1,2,10,11,19,28,29,37,46,47,55,56, name = 'sea'}
	local beach = {3,12,21,30,38,48,57, name = 'beach'}
	local grass = {4,5,6,7,13,15,16,22,23,24,25,26,27,31,32,33,34,35,39,40,41,49, name = 'grass'}
	local city = {8,9,17,18, name = 'city'}
	local forest = {42,43,44,45,50,51,52,53,54,58,59,60,61,62,63, name = 'forest'}
	local dick = {14, name = 'dick'}
	local lighthouse = {20, name = 'lighthouse'}
	local pyramid = {36, name = 'pyramid'}
	local castle = {62, name = 'castle'}
	local types = {sea, beach, grass, city, forest, dick, lighthouse, pyramid, castle}

	do
		local i, j

		for i = 1, #types do
			for j = 1, #types[i] do
				world.map.tiletypes[types[i][j]] = types[i].name
			end
		end
	end

	hero.img = love.graphics.newImage('images/cq-hero-overworld.png')
	hero.line = 1
	hero.column = 8

end

function world.Update(dt)

	world.theme:play()

	transition.screenFadeout(dt)
	transition.musicFadeout(dt, world.theme, 1)

	local mx = math.floor(love.mouse.getX() / world.map.TILE_WIDTH) + 1
	local my = math.floor(love.mouse.getY() / world.map.TILE_HEIGHT) + 1

		if love.mouse.isDown(1) then

			local old_column = hero.column
			local old_line = hero.line

			--Going right
			if mx == hero.column + 1 and my == hero.line then
				hero.column = hero.column + 1
			--Going left
			elseif mx == hero.column - 1 and my == hero.line then
				hero.column = hero.column - 1
			--Going down
			elseif my == hero.line + 1 and mx == hero.column then
				hero.line = hero.line + 1
			--Going up
			elseif my == hero.line - 1 and mx == hero.column then
				hero.line = hero.line - 1
			--Going diagonal down-left
			elseif mx == hero.column - 1 and my == hero.line + 1 then
				hero.column = hero.column - 1
				hero.line = hero.line + 1
			--Going diagonal up-left
			elseif mx == hero.column - 1 and my == hero.line - 1 then
				hero.column = hero.column - 1
				hero.line = hero.line - 1
			--Going diagonal down-right
			elseif mx == hero.column + 1 and my == hero.line + 1 then
				hero.column = hero.column + 1
				hero.line = hero.line + 1
			--Going diagonal up-right
			elseif mx == hero.column + 1 and my == hero.line - 1 then
				hero.column = hero.column + 1
				hero.line = hero.line - 1
			end

			----HERO COLLIDES WITH SEA TILES
			local id = world.map.grid[hero.line][hero.column]
			if world.map.isSea(id) == true then
				hero.column = old_column
				hero.line = old_line
			end
			----

		end

end

function world.Draw()

	----DRAW TEXTURES (cut off the tilesheet in load)
	do
		local c, l

		for l = 1, world.map.MAP_HEIGHT do
	     	for c = 1, world.map.MAP_WIDTH do
	        	local id = world.map.grid[l][c]
	        	local texQuad = world.map.tiletextures[id]
	        	if texQuad ~= nil then
	            	local x = (c - 1) * world.map.TILE_WIDTH
	            	local y = (l - 1) * world.map.TILE_HEIGHT
	            	love.graphics.draw(world.map.tilesheet, texQuad, x, y)
	        	end
	      	end
	    end

	end
    ----

	local x = (hero.column - 1) * world.map.TILE_WIDTH
	local y = (hero.line - 1) * world.map.TILE_HEIGHT
	love.graphics.draw(hero.img, x, y)

	transition.drawFadeout()

end

return world