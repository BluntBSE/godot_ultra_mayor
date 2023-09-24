extends Node2D
var cih = [] #CardsInHand
var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")

var hand_rad_1 = 600.00
var hand_rad_2 = 200.00
var target_angle = deg_to_rad(45)
var target_position = Vector2(hand_rad_1*cos(target_angle),-(hand_rad_2*sin(target_angle)))
var focused_card
var focus_scale = Vector2(1.5, 1.5)
var base_scale = Vector2(1,1)




func _on_hover(card):
	if card.state == "InHand":
		focused_card = card
		card.start_pos = card.position
		card.target_pos = card.start_pos+Vector2(0,-300)
		card.start_scale = card.scale
		card.target_scale = focus_scale
		card.state = card.states["InHandFocus"]

func _on_hover_exit(card):
	print("Card state is " + str(card.state))
	if card.state == "InHandFocus" or card.state == "HandFocused": #Allow exiting whether or not the animati
		card.t = 0 #Reset animation clock?
		print("Exited from hand's perspective")
		card.start_pos = card.position
		card.target_pos = card.stored_position
		card.start_scale = card.scale
		card.target_scale = base_scale
		card.state = card.states["OutHandFocus"] #found u




func _on_draw_source(card_id, origin):
	target_position = Vector2(hand_rad_1*cos(target_angle),-(hand_rad_2*sin(target_angle)))

	#add card to Cards in Hand
	#cih.append(card_id) #Should probably let this be an array of nodes not an array of card IDs...
	#Spawn the card_id passed in
	var spawned_card =  preload("res://Cards/playcard_template.tscn").instantiate().init(card_id)
	self.add_child(spawned_card)
	cih.append(spawned_card)
	#Attach state/transformation events from the card just drawn to the hand. This doesn't trigger them. Enables animations.
	spawned_card.signal_self_in.connect(_on_hover)
	spawned_card.signal_self_out.connect(_on_hover_exit)
	#spawned_card.mouse_entered.connect(_on_hover)
	spawned_card.start_pos = get_local_mouse_position()
	spawned_card.stored_position = target_position
	spawned_card.target_pos = target_position
	spawned_card.state = spawned_card.states["MovingToHand"]
	spawned_card.target_rotation = (deg_to_rad((90)) - target_angle)*.25
	target_angle += 0.25
	#spawned_card.position = (Vector2(100*cih.size()-1,0))
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
