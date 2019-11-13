--A new scene implies a new background (or a black screen)
--In a scene, one click event prints the next element

local this = {}

this.act_intro = {}
this.act_intro.scene_1 = {
	"Mmmh, uh, hein ? Quelle heure il est ? Qui suis-je ?",
	"Est-ce que... Est-ce que j'ai pas un job où je dois aller, ou quelque chose ?",
	"Mgblr, il me faut un café. Tout ira bien lorsque j'aurai bu mon café."
}

--[[this.act_intro.scene_2 = {
	'ID'='KITCHEN',
	"Ehhh ? Plus de café. Bon, pas de panique, je vais juste aller en acheter un au café du coin."
}

this.act_intro.scene_3 = {
	'ID' = 'COFFEE_SHOP',
	'CHARACTER_ENTRANCE' = 2,
	"Bonjour caffelier, votre meilleur café, dans une grande tasse, pronto ! Espresso !",
	"\"rmm brrmm grmm\"\nComment ? Plus de café ? Vous plaisantez bien sûr, on me la fait pas, il y a écrit « coffee » derrière vous. Sans café, vous n'êtes rien !",
	"\"grmmbl brummb drmm\"\nUne pénurie de café ? Toute la ville est touchée ?",
	"\"grmb prummbll\"\nMais c'est une catastrophe, l'économie va s’effondrer ! Je ne me souviens même plus où je travaille !",
	"\"grmmb brmmbl\"\nAller voir le fournisseur de la ville, Mol Palanã ? J'y vais de ce pas ! Tiens bon, brave caffelier !",
	"Plus de café, je n'arrive pas à y croire, c'est déjà un miracle que je tienne debout. Si on ne résout pas ce problème rapidement, tout sera perdu."
}

this.act_intro.scene_4 = {
	'ID'='LIVING_ROOM',
	'CHARACTER_ENTRANCE' = 2,
	"Palanã ! L'heure est grave ! On est que lundi, et j'en ai déjà plein le dos.",
	"A qui le dites-vous, la pénurie de café touche le continent entier."
}]]

return this

