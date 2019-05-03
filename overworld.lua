--[[ 
		This file holds the overworld of coffee quest
--]]

local overworld = {}

overworld.map = {}
overworld.map.grid = {}
overworld.map.tilesheet = nil
overworld.map.tiletextures = {}
overworld.map.tiletypes = {}

overworld.map.grid = {
	{ 1,2,3,4,5,6,7,8,9 },
	{ 10,11,12,13,14,15,16,17,18 },
	{ 19,20,21,22,23,24,25,26,27 },
	{ 28,29,30,31,32,33,34,35,36 },
	{ 37,38,39,40,41,42,43,44,45 },
	{ 46,47,48,49,50,51,52,53,54 },
	{ 55,56,57,58,59,60,61,62,63 }
}

overworld.map.MAP_WIDTH = 9
overworld.map.MAP_HEIGHT = 7
overworld.map.TILE_WIDTH = 100
overworld.map.TILE_HEIGHT = 100

overworld.theme = nil

local hero = {}

hero.img = nil
hero.line = nil
hero.column = nil

function overworld.Load()

	overworld.theme = love.audio.newSource('sounds/cq-theme-overworld.mp3', 'stream')
	overworld.theme:isLooping(true)

	overworld.map.tilesheet = love.graphics.newImage('images/map-tilesheet-grid.png')
	overworld.map.tiletextures[0] = nil

	--Reading/cuting each tilesheet tiles one by one : not related to the screen in any way
    local nb_cols = overworld.map.tilesheet:getWidth() / overworld.map.TILE_WIDTH
    local nb_lines = overworld.map.tilesheet:getHeight() / overworld.map.TILE_HEIGHT
    local l,c
    local id = 1

    for l = 1, nb_lines do
    	for c = 1, nb_cols do
        	overworld.map.tiletextures[id] = love.graphics.newQuad(
          	(c - 1) * overworld.map.TILE_WIDTH, 
          	(l - 1) * overworld.map.TILE_HEIGHT, 
          	overworld.map.TILE_WIDTH, 
          	overworld.map.TILE_HEIGHT, 
          	overworld.map.tilesheet:getWidth(),
          	overworld.map.tilesheet:getHeight()
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
		local i,j = 0,0

		for i = 1, #types do
			for j = 1, #types[i] do
				overworld.map.tiletypes[types[i][j]] = types[i].name
			end
		end
	end

	hero.img = love.graphics.newImage('images/cq-hero-overworld_v2.png')
	hero.line = 1
	hero.column = 8

end

function overworld.Update(dt)

	overworld.theme:play()

	local mx = math.floor(love.mouse.getX() / overworld.map.TILE_WIDTH) + 1
	local my = math.floor(love.mouse.getY() / overworld.map.TILE_HEIGHT) + 1

	if love.mouse.isDown(1) then

		if mx > 0 and mx <= overworld.map.MAP_WIDTH and my > 0 and my <= overworld.map.MAP_HEIGHT then

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

		end

	end

end

function overworld.Draw()

	----DRAW TEXTURES (cut off the tilesheet at load)
	local c, l = 0,0
	for l = 1, overworld.map.MAP_HEIGHT do
     	for c = 1, overworld.map.MAP_WIDTH do
        	local id = overworld.map.grid[l][c]
        	local texQuad = overworld.map.tiletextures[id]
        	if texQuad ~= nil then
            	local x = (c - 1) * overworld.map.TILE_WIDTH
            	local y = (l - 1) * overworld.map.TILE_HEIGHT
            	love.graphics.draw(overworld.map.tilesheet, texQuad, x, y)
        	end
      	end
    end
    ----

	local x = (hero.column - 1) * overworld.map.TILE_WIDTH
	local y = (hero.line - 1) * overworld.map.TILE_HEIGHT
	love.graphics.draw(hero.img, x, y)
    
end


return overworld