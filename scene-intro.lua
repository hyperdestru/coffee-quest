local def = require('define')

local this = {}

this.gui = require('gui')

this.texts = {}

this.texts.VOID = {}
this.texts.VOID[1] = "Mmmh, uh, hein ? Quelle heure il est ? Qui suis-je ?"
this.texts.VOID[2] = "Est-ce que... Est-ce que j'ai pas un job où je dois aller, ou quelque chose ?"
this.texts.VOID[3] = "Mgblr, il me faut un café. Tout ira bien lorsque j'aurai bu mon café."

this.texts.KITCHEN = {}
this.texts.KITCHEN[1] = "Ehhh ? Plus de café. Bon, pas de panique, je vais juste aller en acheter un au café du coin."

this.texts.COFFEE_SHOP = {}
this.texts.COFFEE_SHOP[1] = "Bonjour caffelier, votre meilleur café, dans une grande tasse, pronto ! Espresso !"
this.texts.COFFEE_SHOP[2] = "rmm brrmm grmm \nComment ? Plus de café ? Vous plaisantez bien sûr, on me la fait pas, il y a écrit « coffee » derrière vous. Sans café, vous n'êtes rien !"
this.texts.COFFEE_SHOP[3] = "grmmbl brummb drmm \nUne pénurie de café ? Toute la ville est touchée ?"
this.texts.COFFEE_SHOP[4] = "grmb prummbll \nMais c'est une catastrophe, l'économie va s’effondrer ! Je ne me souviens même plus où je travaille !"
this.texts.COFFEE_SHOP[5] = "grmmb brmmbl \nAller voir le fournisseur de la ville, Mol Palanã ? J'y vais de ce pas ! Tiens bon, brave caffelier !"


function this.load()
	this.t_screens = {}
	this.t_texts = {}

	this.gui.load()

	def.create_act('VOID', nil, "", this.t_screens)
	def.create_text(this.texts.VOID[1], this.t_texts)

	def.create_act('KITCHEN', 'scene-intro/kitchen.png', "", this.t_screens)
	def.create_text("This is the kitchen.", this.t_texts)

	def.create_act('COFFEE_SHOP', 'scene-intro/coffee-shop.png', "", this.t_screens)
	def.create_text("This is the coffee shop.", this.t_texts)

	def.create_act('LIVING_ROOM', 'scene-intro/living-room.png', "", this.t_screens)
	def.create_text("This is the living room.", this.t_texts)

	this.draw_index = 1
	this.draw_index_max = #this.t_screens
end

function this.update(dt)
	this.gui.update(dt)
end

function this.draw()
	this.t_screens[this.draw_index].draw()
	this.gui.draw()
	this.t_texts[this.draw_index].draw()
end

function this.mousepressed(x, y, button, istouch)
	if button == 1 and this.draw_index < this.draw_index_max then
		this.draw_index = this.draw_index + 1
	end
end

----For testing purposes
function this.keypressed(key)
	if key == 'o' then
		def.current_scene = 'OVERWORLD'
	end
end

return this