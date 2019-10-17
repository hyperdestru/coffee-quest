local gui = {}

function gui.new_group()
	local my_group = {}
	my_group.elements = {}

	function my_group:add_elements(p_elt)
		table.insert(self.elements, p_elt)
	end

	function my_group:set_visible(p_visible)
		for n, v in pairs(my_group.elements) do
			if v:set_visible(p_visible) ~= nil then v:set_visible(p_visible) end
		end
	end

	function my_group:update(dt)
		for n, v in pairs(my_group.elements) do
			if v:update(dt) ~= nil then v:update(dt) end
		end
	end

	function my_group:draw()
		love.graphics.push()
		for n, v in pairs(my_group.elements) do
			if v:draw() ~= nil then v:draw() end
		end
		love.graphics.pop()
	end

	return my_group
end


local function new_element(px, py)
	local my_element = {}
	my_element.x = px
	my_element.y = py

	function my_element:draw()
		print("new_element / draw / not implemented")
	end

	function my_element:update(dt)
		--print("new_element / update / not implemented")
	end

	function my_element:set_visible(p_visible)
		self.visible = p_visible
	end
	return my_element
end


function gui.new_panel(px, py, pw, ph)
	local my_panel = new_element(px, py)
	my_panel.w = pw 
	my_panel.h = ph
	my_panel.img = nil

	function my_panel:set_image(p_img)
		self.img = p_img
		self.w = p_img:getWidth()
		self.h = p_img:getHeight()
	end

	function my_panel:draw_panel()
		love.graphics.setColor(1,1,1,1)
		if self.img == nil then
			--if no img is found we use primitive
			love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
		else
			love.graphics.draw(self.img, self.x, self.y)
		end
	end

	function my_panel:draw()
		if self.visible == false then 
			return 
		end
		self:draw_panel()
	end

	return my_panel
end


function gui.new_text(px, py, pw, ph, p_text, p_font, p_color, p_align_x, p_align_y)
	local my_text = gui.new_panel(px, py, pw, ph)
	my_text.text = p_text
	my_text.font = p_font
	my_text.color = p_color 
	my_text.text_w = my_text.font:getWidth(my_text.text)
	my_text.text_h = my_text.font:getHeight(my_text.text)
	my_text.align_x = p_align_x
	my_text.align_y = p_align_y

	function my_text:draw_text()
		love.graphics.setColor(self.color)
		love.graphics.setFont(self.font)
		local x = self.x
		local y = self.y

		if self.align_x == 'center' then
			x = x + ((self.w - self.text_w) / 2)
		end

		if self.align_y == 'center' then
			y = y + ((self.h - self.text_h) / 2)
		end

		love.graphics.print(self.text, x, y)
		love.graphics.setColor(1,1,1)
	end

	function my_text:draw()
		if self.visible == false then 
			return 
		end
		self:draw_text()
	end

	return my_text
end


function gui.new_button(px, py, pw, ph, p_text, p_font, p_color)
	local my_button = gui.new_panel(px, py, pw, ph)
	----Making text, font, and font color optionnal for image-only buttons
	if p_text ~= nil then my_button.text = p_text else my_button.text = "" end
	if p_font ~= nil then my_button.font = p_font else my_button.font = love.graphics.newFont(12) end
	if p_color ~= nil then my_button.color = p_color else my_button.color = {1,1,1} end
	----
	my_button.label = gui.new_text(
		px, 
		py, 
		pw, 
		ph, 
		my_button.text, 
		my_button.font, 
		my_button.color, 
		'center', 
		'center'
	)

	my_button.img_default = nil
	my_button.img_hover = nil
	my_button.img_pressed = nil
	my_button.is_hover = false
	my_button.is_pressed = false
	my_button.old_button_state = false

	function my_button:set_images(p_img_default, p_img_hover, p_img_pressed)
		self.img_default = p_img_default
		self.img_hover = p_img_hover
		self.img_pressed = p_img_pressed
		self.w = p_img_default:getWidth()
		self.h = p_img_default:getHeight()
	end

	function my_button:update(dt)
		local mx, my = love.mouse.getPosition()

		if mx > self.x and mx < self.x + self.w and 
			my > self.y and my < self.y + self.h then

			if self.is_hover == false then
				self.is_hover = true
			end
		--Si la souris est en dehors du bouton
		else
			if self.is_hover == true then
				self.is_hover = false
			end
		end

		if love.mouse.isDown(1) and
			self.is_hover == true and 
			self.is_pressed == false and 
			self.old_button_state == false then
				self.is_pressed = true
		else
			if love.mouse.isDown(1) == false and self.is_pressed == true then
				self.is_pressed = false
			end
		end

		self.old_button_state = love.mouse.isDown(1)
	end

	function my_button:draw()
		love.graphics.setColor(1,1,1)

		if self.is_pressed then

			if self.img_pressed == nil then
				self:draw_panel()
				love.graphics.setColor(1,1,1,0.5)
				love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
			else
				love.graphics.draw(self.img_pressed, self.x, self.y)
			end

		elseif self.is_hover then

			if self.img_hover == nil then
				self:draw_panel()
				love.graphics.setColor(1,1,1)
				love.graphics.rectangle('line', self.x+2, self.y+2, self.w-4, self.h-4)
			else
				love.graphics.draw(self.img_hover, self.x, self.y)
			end

		else
			
			if self.img_default == nil then
				self:draw_panel()
			else
				love.graphics.draw(self.img_default, self.x, self.y)
			end
		end

		self.label:draw()
	end

	return my_button
end

return gui

