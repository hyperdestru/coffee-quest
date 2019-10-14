local def = require('define')

local this = {}

this.gui = require('gui')

function this.create_screen(p_id, p_img, p_text, p_table, p_obj_id, p_obj_img)
	local screen = {}
	screen.id = p_id
	screen.img = love.graphics.newImage('images/'..p_img)
	screen.text = p_text
	screen.with_obj = nil
	if p_obj_id == nil then screen.with_obj = false else screen.with_obj = true end

	if screen.with_obj == true then
		screen.obj = {}
		screen.obj.id = p_obj_id
		screen.obj.img = love.graphics.newImage('images/'..p_obj_img)
	end

	screen.draw = function()
		love.graphics.draw(screen.img)
		if screen.with_obj == true then
			love.graphics.draw(screen.obj.img)
		end
	end

	table.insert(p_table, screen)
	return screen
end

function this.load()
	this.t_screens = {}

	this.gui.load()

	this.create_screen(
		'KITCHEN',
		'scene-intro/kitchen.png',
		'this is the kitchen',
		this.t_screens
	)

	this.create_screen(
		'LIVING_ROOM',
		'scene-intro/living-room.png',
		'this is the living room',
		this.t_screens,
		'MOL',
		'scene-intro/mol-palana-seated.png'
	)

	this.create_screen(
		'COFFEE_SHOP',
		'scene-intro/coffee-shop.png',
		'this is the coffee shop',
		this.t_screens,
		'COFFEE_SHOP_BOSS',
		'scene-intro/coffee-shop-boss.png'
	)

	this.DRAW_INDEX = 1

	----FADEOUT
	this.screen_alpha = 1
	----
end

function this.update(dt)
	this.gui.update(dt)

	----FADEOUT
	if this.screen_alpha > 0 then
		this.screen_alpha = this.screen_alpha - (60*dt) / 200
	else 
		this.screen_alpha = 0
	end
	----
end

function this.draw()
	this.t_screens[this.DRAW_INDEX].draw()

	this.gui.draw()

	----FADEOUT
	love.graphics.setColor(0,0,0, this.screen_alpha)
	love.graphics.rectangle('fill', 0, 0, def.SCREEN_WIDTH, def.SCREEN_HEIGHT)
	love.graphics.setColor(1,1,1,1)
	----
end

function this.mousepressed(x, y, button, istouch)
	if button == 1 and this.DRAW_INDEX < #this.t_screens  then
		this.DRAW_INDEX = this.DRAW_INDEX + 1
	end
end

return this