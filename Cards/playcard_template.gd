extends MarginContainer

var library = CardLibrary.library
var card_name = "Default Name"
var energy = 0
var description = "NO DESCRIPTION LOADED"
var effect = "no path loaded"
var art_image_path = "res://Cards/Resources/PlayerCards/Art_Images/Tank.jpg"
var types = ["Default"]
var card_owner = "Player"
var targeting_types = ["all_kaiju"]
var targeting_num = 1
var script_val_1 = 0
var script_val_2 = 1
var i_effect
var deck_list
var card_id
var card

const color_map = {
	"red":{"text": "#C3423F", "body": "#C3423F"},
	"blue":{"text": "#5BC0EB", "body": "#5BC0EB"},
	"pink":{"text": "#D782BA", "body": "#D782BA"},
	"yellow":{"text": "#FDE74C", "body": "#FDE74C"},
	"green":{"text": "#9BC53D", "body": "#9BC53D"}
}




# {
#	"playcard_firefighting":{
#		"display_name":"Firefighting",
#		"energy":1,
#		"types":["Physical", "Water"],
#		"art_image":"res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
#		"description":"Fight those fires",
#		"effect":"res://Cards/Resources/PlayerCards/Card_Scripts/firefighter_effect.gd",
#		"card_owner":"Player",
#		"targeting_types":["all_kaiju"],
#		"targeting_num":1,
#		"script_val_1":1,
#		"script_val_2":2,
#		"deck_list":"red"
#	}

func init(p_card_id): ##Not _init() because we're a packed scene, not a single node.
	self.card_id = p_card_id
	card = library[p_card_id]
	assign_card()
	do_on_played(i_effect)
	return self #Allows ...instantiate().whatever()
	


func assign_card():
	#print(CardLibrary.library)
	
	#Set Internal Attributes
	card_name = card["display_name"]
	energy = card["energy"]
	art_image_path = card["art_image"]
	description = card["description"]
	effect = load(card["effect"])
	i_effect = effect.new() #I believe this instantiates a node carrying the effect script as a child, which seems appropriate.
	types = card["types"]
	card_owner = card["card_owner"]
	targeting_types = card["targeting_types"]
	targeting_num = card["targeting_num"]
	script_val_1 = card["script_val_1"]
	script_val_2 = card["script_val_2"]
	deck_list = card["deck_list"]
	
	
	##Set Displayed Attributes
	%CardName.text = card["display_name"]
	%EnergyCost.text = str(card["energy"])
	%ArtImage.texture = load(card["art_image"])
	%DescriptionText.text = card["description"]
	var color_key = card["deck_list"]
	%MarginColor.color = color_map[color_key]["body"]
	print(color_map)
	print(color_map[color_key])
	print(color_map[color_key]["body"])
	print( "Color is " + str(%MarginColor.color))
	%CardTypes.text= ", ".join(types)
	
	
	
	
func do_on_played(p_i_effect):
	print(p_i_effect)
	p_i_effect.on_played()
	

	
	


# Called when the node enters the scene tree for the first time.
func _ready(): #We don't use this because newly spawned cards should have .init() called by their parents
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta): #added _
	pass
