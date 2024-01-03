extends Node2D
var cards_in_play = [] #array of cards in play
var focused_card #Card mouse is hovering over.
var base_scale = Vector2(0.75,0.75) #How much cards in play should be shrunk, if at all
var focus_scale = Vector2(1.5,1.5) #How much to zoom, if at all, any card being highlighted
#May ultimately want to replace a scale-up approach with a little mini-card that shows the card details off a smaller t
var avail_energy = 3
var tracking_mouse = false
var mouse_start = null
var mouse_current = null
var mouse_end = null
var dragging = false
var hovered_player_card
var click_target


func acquire_card(card): #assign base scale to cards
	pass



func _on_hover(card):
	#print("Firing on hover of " + card.card_name)
	if card.state == "InPlay":
		print("This is the hover, right?")
		focused_card = card
		#print("Firing on hover2")
		card.stored_position = card.position
		card.start_pos = card.position
		card.target_pos = card.start_pos+Vector2(150, 0)
		card.start_scale = card.scale
		card.target_scale = focus_scale
		card.state = card.states["InInPlayFocus"] #Not a typo. 2x In.
		hovered_player_card = card

		


func _on_hover_exit(card):
	#print("Firing on hover_exit of " + card.card_name)
	if card.state == "InPlayFocused" or card.state == "InInPlayFocus":
		print("Firing on hover_exit2")
		card.t = 0 #Reset animation clock?
		card.start_pos = card.position
		card.target_pos = card.stored_position
		card.start_scale = card.scale
		card.target_scale = base_scale
		card.state = card.states["OutInPlayFocus"]
		
func _on_click(card):
	#Start listening for how far the mouse has traveled
	click_target = card
	tracking_mouse = true
	mouse_start = get_viewport().get_mouse_position()
	pass
	

func _on_release(card):
		if dragging == true:
			unplay_card(card)
		if dragging == false:
			print("Return this card to the hand")
			print(card.card_name)
			unplay_card(card)
			click_target = null
			
			pass
		
func return_to_hand(card):
	print("returning card to hand")
	







func add_card(card):
	print("Add card actually fired")
	var player_hand = card.get_parent() #For removing the card from the PlayerHand
	player_hand.remove_child(card)
	player_hand.cih.erase(card)
	player_hand.refresh_hand()
	self.add_child(card)
	cards_in_play.append(card)
	if ( card.signal_self_in.is_connected(%PlayerHand._on_hover) ):
		card.signal_self_in.disconnect(%PlayerHand._on_hover)
	if ( card.signal_self_out.is_connected(%PlayerHand._on_hover_exit) ):
		card.signal_self_out.disconnect(%PlayerHand._on_hover_exit)

	#And connects them to the PlayerField, which handles ability assignment and targeting.
	card.signal_self_in.connect(%PlayerField._on_hover)
	card.signal_self_out.connect(%PlayerField._on_hover_exit)
	#Need to connect a left_click event for unplay.
	refresh_field()
	pass
	
func refresh_field():
	print("Refreshing the field")
	var card_index = cards_in_play.size()
	for card in cards_in_play:
		print(card.card_name)

		var field_spacing = (card.size.x * base_scale.x) + 15
		var y_offset = 50 #Pixels from the bottom of the Y target.
		var local_dimensions = (%p_field_collider.get_shape().size)
		var target_y = (local_dimensions.y - y_offset) - (150*card_index)
		print("target_y is" + str(target_y))
		card.target_pos = Vector2(0, target_y)
		card.stored_rotation = deg_to_rad(90)
		card.target_rotation = deg_to_rad(90)
		card.start_scale = card.scale
		card.target_scale = base_scale
		card.state = card.states["EnteringPlay"]
		card_index -= 1

		
func unplay_card(card):
			self.remove_child(card)
			cards_in_play.erase(card)
			%PlayerHand.add_child(card)
			%PlayerHand.cih.append(card)
			hovered_player_card = null
			card.state = card.states["MovingToHand"]
	
			if ( card.signal_self_in.is_connected(%PlayerField._on_hover) ):
				card.signal_self_in.disconnect(%PlayerField._on_hover)
			if ( card.signal_self_out.is_connected(%PlayerField._on_hover_exit) ):
				card.signal_self_out.disconnect(%PlayerField._on_hover_exit)

			#And connects them to the PlayerField, which handles ability assignment and targeting.
			card.signal_self_in.connect(%PlayerHand._on_hover)
			card.signal_self_out.connect(%PlayerHand._on_hover_exit)
			refresh_field()
			%PlayerHand.refresh_hand()
	

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hovered_player_card != null:
		print(hovered_player_card)
		print("This is from the hover")
		if Input.is_action_just_pressed("left_click"):
				_on_click(hovered_player_card)
		if Input.is_action_just_released("left_click"):
				_on_release(hovered_player_card)
				
					
	if mouse_start != null:
		mouse_current = get_viewport().get_mouse_position()
		var mouse_dif = mouse_start - mouse_current
		#Clicks on a card return them to the hand. Click-and-drags enable the target finding functionality.
		if (abs(mouse_dif.x) > 100 or abs(mouse_dif.y) > 100):
			dragging == true
		else:
			dragging == false

	

	pass
