extends Node #Do I even need to extend Node?
#class_name PlayCardLibrary through autoload singleton
const library = {
	"playcard_firefighting":{
		"display_name":"Firefighting",
		"energy":1,
		"types":["water", "physical", "instant"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
		"description":"Fight those fires",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "green",
		"instant": false,
	},
		"playcard_hostile_architecture":{
		"display_name":"Hostile Architecture",
		"energy":1,
		"types":["physical"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
		"description":"RESOLVE: Deal two damage to target Kaiju deck. Lock that deck for 1 turn.",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "green",
		"instant": false,
	},
		"playcard_emergency_irrigation":{
		"display_name":"Emergency Irrigation",
		"energy":1,
		"types":["physical"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
		"description":"PLAY: Add 'water' to the local terrain types, and remove 'fire', when this card is played.",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "green",
		"instant": false,
	},
		"playcard_accelerant":{
		"display_name":"Accelerant",
		"energy":1,
		"types":["physical"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
		"description":"PLAY: All 'physical' cards resolved this turn deal four more damage",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "green",
		"instant": false,
	},
	"playcard_glimmer":{
		"display_name":"Glimmer",
		"energy":1,
		"types":["psychic"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/landscape_meditate.jpg",
		"description":"RESOLVE: Identify the top 10 cards of the target deck",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_decks"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "pink",
		"instant": false,
	},
	"playcard_mind_spy":{
		"display_name":"Mind Spy",
		"energy":1,
		"types":["psychic", "instant"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/landscape_meditate.jpg",
		"description":"INSTANT: Reveal the top three cards of two target kaiju decks",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/effect_reveal_n_cards.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":2,
		"script_val_1":3,
		"script_val_2":0,
		"deck_list": "pink",
		"instant": true,
	},
		"playcard_jujitsu":{
		"display_name":"Jujitsu",
		"energy":1,
		"types":["physical"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/landscape_jujitsu.jpg",
		"description":"RESOLVE: Change the target of a kaiju card",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "blue",
		"instant": false,
	},
		"playcard_advance_planning":{
		"display_name":"Advance Planning",
		"energy":1,
		"types":["instant"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/landscape_jujitsu.jpg",
		"description":"INSTANT: Draw a specific card from any deck of your choosing",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["player_decks"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "blue",
		"instant": true,
	},
		"playcard_predictive_modeling":{
		"display_name":"Predictive Modeling",
		"energy":1,
		"types":["physical"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/landscape_jujitsu.jpg",
		"description":"RESOLVE: Reveal the position of all Apocalypse Cards in the chosen deck",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "blue",
		"instant": false,
	},
		"playcard_threat_assessment":{
		"display_name":"Threat Assessment",
		"energy":0,
		"types":["physical"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/landscape_jujitsu.jpg",
		"description":"INSTANT: Highlight all kaiju decks that contain an Apocalypse Card",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "blue",
		"instant": true,
	},
	"playcard_bore_cannon":{
		"display_name":"Bore Cannon",
		"energy":1,
		"types":["physical"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/landscape_drill.jpg",
		"description":"RESOLVE: Deal 8 damage to a target deck",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "red",
		"instant": false,
	},
		"playcard_flamethrower":{
		"display_name":"Flamethrower",
		"energy":2,
		"types":["fire"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/landscape_drill.jpg",
		"description":"RESOLVE: Deal 4 damage to target 2 decks",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "red",
		"instant": false,
	},
		"playcard_echo_matrix":{
		"display_name":"Echo Matrix",
		"energy":0,
		"types":["physical"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/landscape_drill.jpg",
		"description":"PLAY: Add 3 power to your pool.\nRESOLVE: Deal 1 damage to target deck.",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "yellow",
		"instant": false,
	},
		"playcard_load_shedding":{
		"display_name":"Load Shedding",
		"energy":3,
		"types":["electric"],
		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/landscape_drill.jpg",
		"description":"RESOLVE: Deal 5 damage to target deck.\nIf the local environment is 'water', this card costs no energy",
		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
		"card_owner":"Player",
		"targeting_types":["all_kaiju"],
		"targeting_num":1,
		"script_val_1":1,
		"script_val_2":2,
		"deck_list": "yellow",
		"instant": false,
	},
}
