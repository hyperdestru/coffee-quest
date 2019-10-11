local def = require('define')
local gui_module = require('module-gui')

local this = {}

function this.load()
	this.font = love.graphics.newFont('fonts/font-vera-sans/vera.ttf', 20)
	this.font_color = def.color.white

	this.img_main_textbox = love.graphics.newImage('images/gui/panel-textbox-purple.png')
	this.img_button_music = love.graphics.newImage('images/gui/button-music.png')
	this.img_button_speaker = love.graphics.newImage('images/gui/button-speaker.png')
	this.img_button_save = love.graphics.newImage('images/gui/button-save.png')
	this.img_button_next = love.graphics.newImage('images/gui/button-next.png')

	this.group = gui_module.new_group()

	this.main_textbox = gui_module.new_panel(150, 500)
	this.main_textbox:set_image(this.img_main_textbox)
	this.group:add_elements(this.main_textbox)

	this.button_music = gui_module.new_button(20, 657, 40, 35, "", this.font, this.font_color)
	this.button_music:set_images(
		love.graphics.newImage('images/gui/button-music.png'),
		love.graphics.newImage('images/gui/button-music.png'),
		love.graphics.newImage('images/gui/button-music.png')
	)
	this.group:add_elements(this.button_music)

	this.button_speaker = gui_module.new_button(60, 657, 40, 35, "", this.font, this.font_color)
	this.button_speaker:set_images(
		love.graphics.newImage('images/gui/button-speaker.png'),
		love.graphics.newImage('images/gui/button-speaker.png'),
		love.graphics.newImage('images/gui/button-speaker.png')
	)
	this.group:add_elements(this.button_speaker)

	this.button_save = gui_module.new_button(100, 657, 40, 35, "", this.font, this.font_color)
	this.button_save:set_images(
		love.graphics.newImage('images/gui/button-save.png'),
		love.graphics.newImage('images/gui/button-save.png'),
		love.graphics.newImage('images/gui/button-save.png')
	)
	this.group:add_elements(this.button_save)

	this.button_next = gui_module.new_button(140, 657, 40, 35, "", this.font, this.font_color)
	this.button_next:set_images(
		love.graphics.newImage('images/gui/button-next.png'),
		love.graphics.newImage('images/gui/button-next.png'),
		love.graphics.newImage('images/gui/button-next.png')
	)
	this.group:add_elements(this.button_next)
end

function this.update(dt)
	this.group:update(dt)
end

function this.draw()
	love.graphics.rectangle('fill', 0, def.SCREEN_HEIGHT-50, def.SCREEN_WIDTH, 50)
	this.group:draw()
end

return this