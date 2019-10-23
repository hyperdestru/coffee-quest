local this = {}

this.title = require('title')
this.overworld = require('overworld')

this.stack = {
	{'title', this.title},
	{'overworld', this.overworld}
}

this.stack.current = nil

function this.set(ps)
	this.stack.current = ps
end

function this.get()
	return this.stack.current
end

function this.load()
	local i = 1
	for i = 1, #this.stack do
		if this.stack[i][2].load() ~= nil then
			this.stack[i][2].load()
		end
	end
end

function this.update(dt)
	local i = 1
	for i = 1, #this.stack do
		if this.get() == this.stack[i][1] and this.stack[i][2].update(dt) ~= nil then
			this.stack[i][2].update(dt)
		end
	end
end

function this.draw()
	local i = 1
	for i = 1, #this.stack do
		if this.get() == this.stack[i][1] and this.stack[i][2].draw() ~= nil then
			this.stack[i][2].draw()
		end
	end
end

function this.keypressed(key)
	local i = 1
	for i = 1, #this.stack do
		if this.get() == this.stack[i][1] and this.stack[i][2].keypressed(key) ~= nil then
			this.stack[i][2].keypressed(key)
		end
	end
end

return this
