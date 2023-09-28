extends Node2D
var cih = [] #CardsInHand
var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")
var mc_ray #mouse raycast
var hand_rad_1 = 600.00
var hand_rad_2 = 200.00
var target_angle = deg_to_rad(45)
var target_position = Vector2(hand_rad_1*cos(target_angle),-(hand_rad_2*sin(target_angle)))
var focused_card
var focus_scale = Vector2(1.5, 1.5)
var base_scale = Vector2(1,1)

signal card_being_dragged(card)


func _on_drag(card):
	#print("Firing on drag of " + card.card_name)
	if card.state == "HandFocused":
		card.state = "Dragged"

func _on_hover(card):
	#print("Firing on hover of " + card.card_name)
	if card.state == "InHand":
		#print("Firing on hover2")
		focused_card = card
		card.start_pos = card.position
		card.target_pos = card.start_pos+Vector2(0,-300)
		card.start_scale = card.scale
		card.target_scale = focus_scale
		card.state = card.states["InHandFocus"]

func _on_hover_exit(card):
	#print("Firing on hover_exit of " + card.card_name)
	if card.state == "InHandFocus" or card.state == "HandFocused" or card.state == "Dragged":
		#If there's no drag_target on the parent...
		if get_parent().drag_target == null:
			print("Firing on hover_exit2")#Allow exiting whether or not the animati
			card.t = 0 #Reset animation clock?
			card.start_pos = card.position
			card.target_pos = card.stored_position
			card.start_scale = card.scale
			card.target_scale = base_scale
			card.state = card.states["OutHandFocus"] #found u


func _on_click(card):
	if card.state == "InHandFocus":
		card.state = "Dragging"
		#Set Card State to "Dragging". When Released, this will snap back. So we need to record original position on the c
		pass
	pass

func _on_click_release(card):
	#If over the p_field, add it there.
	#do any on_play functions
	#If not, put it in the player hand.
	pass

func _on_draw_source(card_id, origin):
	target_position = Vector2(hand_rad_1*cos(target_angle),-(hand_rad_2*sin(target_angle)))


	#add card to Cards in Hand
	#Spawn the card_id passed in
	var spawned_card =  preload("res://Cards/playcard_template.tscn").instantiate().init(card_id)
	self.add_child(spawned_card)
	cih.append(spawned_card)
	#Attach state/transformation events from the card just drawn to the hand. This doesn't trigger them. Enables animations.
	spawned_card.signal_self_in.connect(_on_hover)
	spawned_card.signal_self_out.connect(_on_hover_exit)
	spawned_card.signal_self_dragged.connect(_on_drag)
	spawned_card.start_pos = get_local_mouse_position()
	spawned_card.stored_position = target_position
	spawned_card.target_pos = target_position
	spawned_card.state = spawned_card.states["MovingToHand"]
	spawned_card.target_rotation = (deg_to_rad((90)) - target_angle)*.25
	spawned_card.stored_rotation = spawned_card.target_rotation
	target_angle += 0.25
	#maybe the playmat needs to become aware of the "Dragged" event here, too.
	var playmat = get_parent()
	spawned_card.signal_self_dragged.connect(playmat._on_dragged)

	#refresh_hand()
	return spawned_card





func refresh_hand(): #Idk about this one
	var angle = deg_to_rad(90)

	#Iterate through all child nodes of the hand and count them.
	var cards = self.get_children()

	cards.erase(get_node("_hand_reference"))
	#Hide and set to same position as parent.
	for child in cards:

		child.position = Vector2(0,0)

	for child in cards:
		var oval_vector = Vector2(hand_rad_1*cos(angle),-(hand_rad_2*sin(angle)))
		child.position += oval_vector
		angle += 0.25 #This should be calculated based on the number of cards in the hand.



	pass #Call this when a card is drawn. Change up the positions of the cards and add the newest one to it.


# Called when the node enters the scene tree for the first time.
func _ready():
	#Search for all nodes with a _deck_list property and register them to the hand as possible draw sources
	if get_parent() != null:
		var children = get_parent().get_children()
		for i in range(children.size()):
			if (children[i].get("_deck_list")):
				children[i].draw_source.connect(_on_draw_source)


	#%PublicWorks.draw_source.connect(_on_draw_source)
	var midpoint_x = viewport_width/2
	var midpoint_y = viewport_height/2
	self.position = Vector2(midpoint_x, viewport_height - 100)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
