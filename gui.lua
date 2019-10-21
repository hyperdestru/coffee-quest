local gui_module = require('module-gui')

local this = {}

function this.load()
	this.img_main_textbox = love.graphics.newImage('images/gui/panel-textbox-purple.png')

	this.img_button_music = love.graphics.newImage('images/gui/button-music.png')
	this.img_button_music_hover = love.graphics.newImage('images/gui/button-music-hover.png')
	this.img_button_music_pressed = love.graphics.newImage('images/gui/button-music-pressed.png')

	this.img_button_speaker = love.graphics.newImage('images/gui/button-speaker.png')
	this.img_button_speaker_hover = love.graphics.newImage('images/gui/button-speaker-hover.png')
	this.img_button_speaker_pressed = love.graphics.newImage('images/gui/button-speaker-pressed.png')

	this.img_button_save = love.graphics.newImage('images/gui/button-save.png')
	this.img_button_save_hover = love.graphics.newImage('images/gui/button-save-hover.png')

	this.img_button_next = love.graphics.newImage('images/gui/button-next.png')
	this.img_button_next_hover = love.graphics.newImage('images/gui/button-next-hover.png')

	this.group = gui_module.new_group()

	this.main_textbox = gui_module.new_panel(150, 490)
	this.main_textbox:set_image(this.img_main_textbox)
	this.group:add_elements(this.main_textbox)

	this.button_music = gui_module.new_button(20, 657, 40, 35)
	this.button_music:set_images(
		this.img_button_music,
		this.img_button_music_hover,
		this.img_button_music_pressed
	)
	this.group:add_elements(this.button_music)

	this.button_speaker = gui_module.new_button(60, 657, 40, 35)
	this.button_speaker:set_images(
		this.img_button_speaker,
		this.img_button_speaker_hover,
		this.img_button_speaker_pressed
	)
	this.group:add_elements(this.button_speaker)

	this.button_save = gui_module.new_button(100, 657, 40, 35)
	this.button_save:set_images(
		this.img_button_save,
		this.img_button_save_hover,
		this.img_button_save
	)
	this.group:add_elements(this.button_save)

	this.button_next = gui_module.new_button(140, 657, 40, 35)
	this.button_next:set_images(
		this.img_button_next,
		this.img_button_next_hover,
		this.img_button_next
	)
	this.group:add_elements(this.button_next)
end

function this.update(dt)
	this.group:update(dt)
end

function this.draw()
	this.group:draw()
end

return this