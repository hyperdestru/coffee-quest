--[[ 
		This file holds the Hero of coffee quest
--]]

local Hero = {}


Hero.img = nil
Hero.line = nil
Hero.column = nil

scfactor = 1
down = false

function Hero.Load()

	Hero.img = love.graphics.newImage('images/gc_hero_overworld.png')
	Hero.line = 1
	Hero.column = 8

end

function Hero.Update(dt, pMap)

	local mx = math.floor(love.mouse.getX() / pMap.TILE_WIDTH) + 1
	local my = math.floor(love.mouse.getY() / pMap.TILE_HEIGHT) + 1

	if love.mouse.isDown(1) then

		if mx > 0 and mx <= pMap.MAP_WIDTH and my > 0 and my <= pMap.MAP_HEIGHT then

			--Going right
			if mx == Hero.column + 1 and my == Hero.line then
				Hero.column = Hero.column + 1
			--Going left
			elseif mx == Hero.column - 1 and my == Hero.line then
				Hero.column = Hero.column - 1
			--Going down
			elseif my == Hero.line + 1 and mx == Hero.column then
				Hero.line = Hero.line + 1
			--Going up
			elseif my == Hero.line - 1 and mx == Hero.column then
				Hero.line = Hero.line - 1
			--Going diagonal down-left
			elseif mx == Hero.column - 1 and my == Hero.line + 1 then
				Hero.column = Hero.column - 1
				Hero.line = Hero.line + 1
			--Going diagonal up-left
			elseif mx == Hero.column - 1 and my == Hero.line - 1 then
				Hero.column = Hero.column - 1
				Hero.line = Hero.line - 1
			--Going diagonal down-right
			elseif mx == Hero.column + 1 and my == Hero.line + 1 then
				Hero.column = Hero.column + 1
				Hero.line = Hero.line + 1
			--Going diagonal up-right
			elseif mx == Hero.column + 1 and my == Hero.line - 1 then
				Hero.column = Hero.column + 1
				Hero.line = Hero.line - 1
			end

		end

	end

end

function Hero.Draw(pMap)

	local x = (Hero.column - 1) * pMap.TILE_WIDTH
	local y = (Hero.line - 1) * pMap.TILE_HEIGHT
	love.graphics.draw(Hero.img, x, y)

end


return Hero