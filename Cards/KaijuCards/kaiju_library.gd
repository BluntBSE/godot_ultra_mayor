extends Node

#	"playcard_firefighting":{
#		"display_name":"Firefighting",
#		"energy":1,
#		"types":["Water"],
#		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
#		"description":"Fight those fires",
#		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
#		"card_owner":"Player",
#		"targeting_types":["all_kaiju"],
#		"targeting_num":1,
#		"script_val_1":1,
#		"script_val_2":2,
#		"deck_list": "green"
#	}

var library = {
	"kcard_chomp":{
		"display_name":"Chomp",
		"energy":1,
		"types":["physical"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
		"description":"Fight those fires",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"kaiju",
		"targeting_types":["player_decks"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"anatomy": "head",
		"tier": 1,
		"themes": ["physical", "organic", "damage"],
		"apocalypse": false
	},
	"kcard_incinerate_organic":{
		"display_name":"Incinerate",
		"energy":1,
		"types":["fire", "organic"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
		"description":"Deals 3 damage to target deck",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"kaiju",
		"targeting_types":["player_decks"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"anatomy": "head",
		"tier": 1,
		"themes": ["fire", "organic", "damage"],
		"apocalypse": false
	},
		"kcard_pyroclasm":{
		"display_name":"Pyroclasm",
		"energy":1,
		"types":["fire", "organic"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
		"description":"Deals two damage to all enemey decks. Adds the 'fire' element to the field",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"kaiju",
		"targeting_types":["player_decks"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"anatomy": "head",
		"tier": 1,
		"themes": ["fire", "organic", "damage"],
		"apocalypse": true,
	},
	"kcard_cinderhide":{
		"display_name":"Cinderhide",
		"energy":1,
		"types":["fire", "organic"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
		"description":"'Water' type cards have no effect this round.",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"kaiju",
		"targeting_types":["player_decks"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"anatomy": "head",
		"tier": 1,
		"themes": ["fire", "organic", "damage"],
		"apocalypse": true,
	}

}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
