local Hero = {}

Hero.img = nil
Hero.line = 1
Hero.column = 8 

function Hero.Load()

	Hero.img = love.graphics.newImage('images/gc_hero_overworld.png')

end

function Hero.Update(dt, pMap)

	local mx = math.floor(love.mouse.getX() / pMap.TILE_WIDTH) + 1
	local my = math.floor(love.mouse.getY() / pMap.TILE_HEIGHT) + 1

	if love.mouse.isDown(1) then

		if mx == Hero.column + 1 and my == Hero.line then
			Hero.column = Hero.column + 1
		elseif mx == Hero.column - 1 and my == Hero.line then
			Hero.column = Hero.column - 1
		end

		if my == Hero.line + 1 and mx == Hero.column then
			Hero.line = Hero.line + 1
		elseif my == Hero.line - 1 and mx == Hero.column then
			Hero.line = Hero.line - 1
		end
	end

end

function Hero.Draw(pMap)

	local x = (Hero.column - 1) * pMap.TILE_WIDTH
	local y = (Hero.line - 1) * pMap.TILE_HEIGHT
	love.graphics.draw(Hero.img, x, y, 0, 4, 4)

end

return Hero