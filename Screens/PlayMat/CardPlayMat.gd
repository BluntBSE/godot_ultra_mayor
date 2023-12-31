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
	print(%PlayerHand._on_hover)
	player_field = get_node("PlayerField")
	player_hand = get_node("PlayerHand")
	player_field_dimensions = %p_field_collider.get_shape().size
	kaiju_field = get_node("KaijuField")
	#kaiju_field_dimensions = %k_field_collider.get_shape().size
	pass # Replace with function body.

func find_drag_targets():
	#Find the first parent with drag_target = true

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

#Handles the drag of cards from the hand into the playfield
	if dragged_card != null:
		if drag_target != null:
			if drag_target == player_field:
				if Input.is_action_just_released("left_click"): #Dragged card to Player Field
					var card_parent = dragged_card.get_parent()
					card_parent.remove_child(dragged_card)
					drag_target.add_child(dragged_card) #If we're dragging to the playfield after all. This all needs to be reworked.
					drag_target.acquire_card(dragged_card)
					player_hand.cih.erase(dragged_card)
					player_hand.refresh_hand() #Rearrange cards to fill in any gaps. 31
					dragged_card.start_pos = drag_target.get_local_mouse_position()
					drag_target.cards_in_play.append(dragged_card)
					var num_in_play = drag_target.cards_in_play.size()
					var field_spacing = (dragged_card.size.x * drag_target.base_scale.x) + 15
					dragged_card.target_pos = Vector2(0,player_field_dimensions.y - 150 - (field_spacing*num_in_play)) #This is relative to CardPlayMat.
					dragged_card.stored_rotation = deg_to_rad(90)
					dragged_card.start_scale = dragged_card.scale
					dragged_card.target_scale = drag_target.base_scale
					#Disconnects the hovering events that are present in the hand...
					if ( dragged_card.signal_self_in.is_connected(%PlayerHand._on_hover) ):
						dragged_card.signal_self_in.disconnect(%PlayerHand._on_hover)
					if ( dragged_card.signal_self_out.is_connected(%PlayerHand._on_hover_exit) ):
						dragged_card.signal_self_out.disconnect(%PlayerHand._on_hover_exit)

					#And connects them to the PlayerField, which handles ability assignment and targeting.
					dragged_card.signal_self_in.connect(%PlayerField._on_hover)
					dragged_card.signal_self_out.connect(%PlayerField._on_hover_exit)
					#Check here if the card is an 'instant' type card. If so, its script must run immediately, its power must be deducted, and it must be removed from the game instead of entering play.
					if dragged_card.instant == true:
						print("You tried to play an instant!")
						%PlayerField.avail_energy -= dragged_card.energy
						dragged_card.do_on_played()
						dragged_card.queue_free()
						#Tell the player hand to reorganize itself.
						#reorganize()
						return
					dragged_card.state = dragged_card.states["EnteringPlay"] #I actually need to check what state the card is in when we start this for assigning targets, but this works for now
					dragged_card = null

	pass




func _on_playerfield_mouse_entered():
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


