local menu = {}

menu.img = nil

function menu.Load()
	menu.img = love.graphics.newImage('images/cq-menu.png')
end

function menu.Draw()
	love.graphics.draw(menu.img)
end

function menu.Keypressed(key)
	if key == 'space' then
		__currentscreen__ = 'overworld'
	end
end

return menu