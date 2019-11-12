local this = {}

function this.load()
	this.theme = love.audio.newSource('sounds/title-screen/title-screen-theme.mp3', 'stream')
	this.theme:isLooping(true)
	this.img = love.graphics.newImage('images/title-screen/title-screen-background.png')
end

function this.update(dt)
	this.theme:play()
end

function this.draw()
	love.graphics.draw(this.img)
end

function this.keypressed(key)
	if key == 'space' then
		this.theme:stop()
		states.set('act_intro')
	end
end

return this