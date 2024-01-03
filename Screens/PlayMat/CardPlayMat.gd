extends Node2D
var mc_ray #mouse raycast
var terrain_types = ["powered", "city"]
var player_field
var player_field_dimensions
var player_hand
var kaiju_field
var kaiju_field_dimensions
var dragged_card = null
var target_available = false
var drag_target

#{"origin":<cardNode> "targets":[node,node]}
var p_action_queue = []
var k_action_queue = []

func _on_dragged(card):
	print("I, the mat, am aware that a card is being dragged. It is: " + str(card.card_name))
	dragged_card = card


# Called when the node enters the scene tree for the first time.
func _ready():
	player_field = get_node("PlayerField")
	player_hand = get_node("PlayerHand")
	player_field_dimensions = %p_field_collider.get_shape().size
	kaiju_field = get_node("KaijuField")
	#kaiju_field_dimensions = %k_field_collider.get_shape().size
	pass # Replace with function body.

func find_drag_targets(): #Jan 2 2024 -- Do I still need this?
	#Find the first parent with drag_target = true

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

#Handles the drag of cards from the hand into the playfield
	if dragged_card != null:
		if drag_target != null:
			if drag_target == player_field:
				
				if Input.is_action_just_released("left_click"): #Dragged card to Player Field
					print("Confirmed you attempted to drag into the player field")
					%PlayerField.add_card(dragged_card)
					#Check here if the card is an 'instant' type card. If so, its script must run immediately, its power must be deducted, and it must be removed from the game instead of entering play.
					if dragged_card.instant == true:
						print("You tried to play an instant!")
						%PlayerField.avail_energy -= dragged_card.energy
						dragged_card.do_on_played()
						dragged_card.queue_free()

						return
					dragged_card.state = dragged_card.states["EnteringPlay"] #I actually need to check what state the card is in when we start this for assigning targets, but this works for now
					dragged_card = null

	pass




func _on_playerfield_mouse_entered():
	print("Set the drag target to player field")
	drag_target = player_field
	get_node("PlayerField/p_Area2D/p_field_collider/p_field_sprite").visible = true


func _on_playerfield_mouse_exit():
	drag_target = null
	get_node("PlayerField/p_Area2D/p_field_collider/p_field_sprite").visible = false

func _on_kaijufield_mouse_entered():
	drag_target = kaiju_field
	get_node("KaijuField/k_Area2D/k_field_collider/k_field_sprite").visible = true


func _on_kaijufield_mouse_exit():
	drag_target = null
	get_node("KaijuField/k_Area2D/k_field_collider/k_field_sprite").visible = false


