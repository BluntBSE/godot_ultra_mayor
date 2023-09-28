extends Node2D
var cards_in_play = [] #array of cards in play
var drag_target = true
#An array of anonymous dictionaries that look like

#{"origin":<cardNode> "targets":[node,node]}
var p_action_queue = []
var k_action_queue = []
var focused_card #Card mouse is hovering over.
var base_scale = Vector2(1.0,1.0) #How much cards in play should be shrunk, if at all
var focus_scale = Vector2(1.5,1.5) #How much to zoom, if at all, any card being highlighted
#May ultimately want to replace a scale-up approach with a little mini-card that shows the card details off a smaller t

func acquire_card(card): #assign base scale to cards
	pass

func _on_drag(card):
	#print("Firing on drag of " + card.card_name)
	if card.state == "HandFocused":
		card.state = "Dragged"

func _on_hover(card):
	#print("Firing on hover of " + card.card_name)
	if card.state == "InPlay":
		#print("Firing on hover2")
		focused_card = card
		card.stored_position = card.position
		card.start_pos = card.position
		card.target_pos = card.start_pos+Vector2(150, 0)
		card.start_scale = card.scale
		card.target_scale = focus_scale
		card.state = card.states["InInPlayFocus"] #Not a typo. 2x In.


func _on_hover_exit(card):
	#print("Firing on hover_exit of " + card.card_name)
	if card.state == "InPlayFocused" or card.state == "InInPlayFocus":
		#If there's no drag_target on the parent...
		#if get_parent().drag_target == null: #Is this it...?
		print("Firing on hover_exit2")#Allow exiting whether or not the animati
		card.t = 0 #Reset animation clock?
		card.start_pos = card.position
		card.target_pos = card.stored_position
		card.start_scale = card.scale
		card.target_scale = base_scale
		card.state = card.states["OutInPlayFocus"] #found u



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
