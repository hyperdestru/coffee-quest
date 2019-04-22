--[[ 
		This file holds the Oworld of coffee quest
		Requires : hero.lua	
--]]

local Ow = {}

Ow.Hero = require('hero')

Ow.Map = {}
Ow.Map.Grid = {}
Ow.Map.tilesheet = nil
Ow.Map.TileTextures = {}
Ow.Map.TileTypes = {}

Ow.Map.Grid = {
	{ 1,2,3,4,5,6,7,8,9 },
	{ 10,11,12,13,14,15,16,17,18 },
	{ 19,20,21,22,23,24,25,26,27 },
	{ 28,29,30,31,32,33,34,35,36 },
	{ 37,38,39,40,41,42,43,44,45 },
	{ 46,47,48,49,50,51,52,53,54 },
	{ 55,56,57,58,59,60,61,62,63 }
}

Ow.Map.MAP_WIDTH = 9
Ow.Map.MAP_HEIGHT = 7
Ow.Map.TILE_WIDTH = 100
Ow.Map.TILE_HEIGHT = 100

Ow.theme = nil

function Ow.Load()

	print('Loading music')
	Ow.theme = love.audio.newSource('sounds/cq-theme-overworld.mp3', 'stream')
	Ow.theme:isLooping(true)
	print('Music loaded')

	Ow.Map.tilesheet = love.graphics.newImage('images/map-tilesheet-grid.png')
	Ow.Map.TileTextures[0] = nil

	--Reading/cuting each tilesheet tiles one by one : not related to the screen in any way
	print("Loading textures from tilesheet")
    local nb_cols = Ow.Map.tilesheet:getWidth() / Ow.Map.TILE_WIDTH
    local nb_lines = Ow.Map.tilesheet:getHeight() / Ow.Map.TILE_HEIGHT
    local l,c
    local id = 1

    for l = 1, nb_lines do
    	for c = 1, nb_cols do
        	Ow.Map.TileTextures[id] = love.graphics.newQuad(
          	(c - 1) * Ow.Map.TILE_WIDTH, 
          	(l - 1) * Ow.Map.TILE_HEIGHT, 
          	Ow.Map.TILE_WIDTH, 
          	Ow.Map.TILE_HEIGHT, 
          	Ow.Map.tilesheet:getWidth(),
          	Ow.Map.tilesheet:getHeight()
        	)
        id = id + 1
      	end
    end
    print("Textures loaded.")
    ----

    print("Loading textures types")
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
				Ow.Map.TileTypes[types[i][j]] = types[i].name
			end
		end
	end
	print("Textures types loaded.")

	----LOAD HERO 
	Ow.Hero.Load()
	----

end

function Ow.Update(dt)

	Ow.theme:play()

	----UPDATE HERO
	Ow.Hero.Update(dt, Ow.Map)
	----

end

function Ow.Draw()

	----DRAW TEXTURES (cut off the tilesheet at load)
	local c, l = 0,0
	for l = 1, Ow.Map.MAP_HEIGHT do
     	for c = 1, Ow.Map.MAP_WIDTH do
        	local id = Ow.Map.Grid[l][c]
        	local texQuad = Ow.Map.TileTextures[id]
        	if texQuad ~= nil then
            	local x = (c - 1) * Ow.Map.TILE_WIDTH
            	local y = (l - 1) * Ow.Map.TILE_HEIGHT
            	love.graphics.draw(Ow.Map.tilesheet, texQuad, x, y)
        	end
      	end
    end
    ----

	----DRAW HERO
    Ow.Hero.Draw(Ow.Map)
    ----
    
end


return Ow