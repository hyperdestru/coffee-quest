--[[ 
		This file holds the overworld of coffee quest
		Requires : hero.lua	
--]]

local Game = {}

Game.Map = {}
Game.Map.Grid = {}
Game.Map.tilesheet = nil
Game.Map.TileTextures = {}
Game.Map.TileTypes = {}

Game.Map.Grid = {
	{ 1,2,3,4,5,6,7,8,9 },
	{ 10,11,12,13,14,15,16,17,18 },
	{ 19,20,21,22,23,24,25,26,27 },
	{ 28,29,30,31,32,33,34,35,36 },
	{ 37,38,39,40,41,42,43,44,45 },
	{ 46,47,48,49,50,51,52,53,54 },
	{ 55,56,57,58,59,60,61,62,63 }
}

Game.Map.MAP_WIDTH = 9
Game.Map.MAP_HEIGHT = 7
Game.Map.TILE_WIDTH = 100
Game.Map.TILE_HEIGHT = 100

Game.music_theme = nil

function Game.Load()

	GAME_WIDTH = love.graphics.getWidth()
	GAME_HEIGHT = love.graphics.getHeight()

	Game.music_theme = love.audio.newSource('sounds/cq_theme_overworld.wav', 'stream')
	Game.music_theme:isLooping(true)
	Game.music_theme:play()

	Game.Map.tilesheet = love.graphics.newImage('images/map-tilesheet-grid.png')
	Game.Map.TileTextures[0] = nil

	--Reading/cuting each tilesheet tiles one by one : not related to the screen in any way
	print("Loading textures from tilesheet")
    local nb_cols = Game.Map.tilesheet:getWidth() / Game.Map.TILE_WIDTH
    local nb_lines = Game.Map.tilesheet:getHeight() / Game.Map.TILE_HEIGHT
    local l,c
    local id = 1
    for l = 1, nb_lines do
      for c = 1, nb_cols do
        Game.Map.TileTextures[id] = love.graphics.newQuad(
          (c - 1) * Game.Map.TILE_WIDTH, 
          (l - 1) * Game.Map.TILE_HEIGHT, 
          Game.Map.TILE_WIDTH, 
          Game.Map.TILE_HEIGHT, 
          Game.Map.tilesheet:getWidth(),
          Game.Map.tilesheet:getHeight()
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
				Game.Map.TileTypes[types[i][j]] = types[i].name
			end
		end
	end
	print("Textures types loaded.")

end


function Game.Draw()

	----Drawing the actual textures "cut" off the tilesheet in Game.Load()
	local c, l = 0,0
    for l = 1, Game.Map.MAP_HEIGHT do
      for c = 1, Game.Map.MAP_WIDTH do
        local id = Game.Map.Grid[l][c]
        local texQuad = Game.Map.TileTextures[id]
        if texQuad ~= nil then
            local x = (c - 1) * Game.Map.TILE_WIDTH
            local y = (l - 1) * Game.Map.TILE_HEIGHT
            love.graphics.draw(Game.Map.tilesheet, texQuad, x, y)
        end
      end
    end
    ----

    ----TILE DATA ON MOUSEOVER
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()
    --We add one because of 1-based tables in lua (instead of 0)
    local col = math.floor(mouseX / Game.Map.TILE_WIDTH) + 1
    local line = math.floor(mouseY / Game.Map.TILE_HEIGHT) + 1
    if col > 0 and col <= Game.Map.MAP_WIDTH and line > 0 and line <= Game.Map.MAP_HEIGHT then

    	local id = Game.Map.Grid[line][col]

    	love.graphics.setColor(255,0,0)
    	love.graphics.print("Type de tile : ".. tostring(Game.Map.TileTypes[id]) .. " (ID = " .. tostring(id) .. ")", 10, GAME_HEIGHT - 32, 0,2,2)
     	love.graphics.setColor(255,255,255)

    else
      	love.graphics.print("Hors du tableau !", 10, GAME_HEIGHT - 32, 0,2,2)
    end
    ----
    
end

return Game