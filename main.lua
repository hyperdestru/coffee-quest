states = require('state-manager')

function love.load()
	states.set('title')
	states.load()
end

function love.update(dt)
	states.update(dt)
end

function love.draw()
	states.draw()
end

function love.keypressed(key)
	states.keypressed(key)
end

