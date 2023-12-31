
#Should I make this a class? Probably. But some of my node references will break in the short term.:
extends MarginContainer
var library #= PlayCardLibrary.library #Might need to incorporate kaiju library here somehow.
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
var instant
var card
var focus_scale = 1.5
var focus_offset = Vector2(0,-(175*focus_scale)) # offset should really be in the same direction >:( That means making this the aprent.
var focus_rotation = deg_to_rad(0)
var orig_rotation

const color_map = {
	"red":{"text": "#C3423F", "body": "#C3423F"},
	"blue":{"text": "#5BC0EB", "body": "#5BC0EB"},
	"pink":{"text": "#D782BA", "body": "#D782BA"},
	"yellow":{"text": "#FDE74C", "body": "#FDE74C"},
	"green":{"text": "#9BC53D", "body": "#9BC53D"}
}

var state = "Hidden"
var t = 0 # for interpolation
var t_scale = 4 #for interpolation
var start_pos
var target_pos
var start_rotation = rotation
var target_rotation
var start_scale
var target_scale
var stored_position #When a card is hovered, remember where it came from so it can go back regardless of if it is unhovered before completing.
var stored_rotation #Same for rotation
var _hovered

const states = {
	"InHand": "InHand",
	"MovingToHand": "MovingToHand",
	"Reorganizing": "Reorganizing",
	"EnteringPlay": "EnteringPlay",
	"InPlay": "InPlay",
	"InInPlayFocus": "InInPlayFocus",
	"InPlayFocused": "InPlayFocused",
	"OutInPlayFocus": "OutInPlayFocus",
	"HandFocused": "HandFocused",
	"InHandFocus": "InHandFocus",
	"OutHandFocus": "OutHandFocus",
	"Hidden": "Hidden",
	"Dragged": "Dragged",
	"Targeting": "Targeting"
}

#Passes self reference during on mouse enter & exit events to the hand node.
signal signal_self_in(p_self)
signal signal_self_out(p_self)
signal signal_self_dragged(p_self) #Maybe need a playmat listener to grab this...Maybe?
signal signal_target(p_self, target)


func init(p_card_id, p_library): ##Not _init() because we're a packed scene, not a single node.
	self.card_id = p_card_id
	library = p_library
	card = p_library[p_card_id] #Needs to be adapted for kaiju
	assign_card()
	return self #Allows ...instantiate().whatever()



func assign_card():
	#print(PlayCardLibrary.library)

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
	instant = card["instant"]


	##Set Displayed Attributes
	%CardName.text = card["display_name"]
	%EnergyCost.text = str(card["energy"])
	%ArtImage.texture = load(card["art_image"])
	%DescriptionText.text = card["description"]
	var color_key = card["deck_list"]
	%MarginColor.color = color_map[color_key]["body"]
	%CardTypes.text= ", ".join(types)

func smoother_lerp(x): #maybe put this in a utility class
	return ((x) * (x) * (3 - 2 * (x)))

 
func do_on_played():
	print(i_effect)
	i_effect.on_played({"energy": energy, "script_val_1": script_val_1, "script_val_2": script_val_2})


# Called when the node enters the scene tree for the first time.
func _ready(): #We don't use this because newly spawned cards should have .init() called by their parents
	pivot_offset = size/2 #If you get rotation weirdness, this is why. We're setting pivot to the middle.
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): #Switch with match statement instead of ifs later.
	if state == "Dragged":
		if signal_self_out.is_connected(get_parent()._on_hover_exit):
			#Prevent hover events from firing during drag to prevent conflicts with dragging over in play cards
			signal_self_out.disconnect(get_parent()._on_hover_exit)
			signal_self_in.disconnect(get_parent()._on_hover)
		if Input.is_action_just_released("left_click"):
			signal_self_out.connect(get_parent()._on_hover_exit)
			signal_self_in.connect(get_parent()._on_hover)
			signal_self_out.emit(self)



	if state == "HandFocused":
		if _hovered == true:
			if Input.is_action_pressed("left_click"):
				signal_self_dragged.emit(self)

	if state == "Targeting":
		pass

	match state:
		"InHand":
			pass
		"MovingToHand":
			if t <= 1: #always 1 with linear interpolation
				position = start_pos.lerp(target_pos, smoother_lerp(t))
				rotation = lerp(start_rotation, target_rotation,smoother_lerp(t))
				t += delta * t_scale
			else:
				position = target_pos
				rotation = target_rotation
				state = "InHand"
				t = 0 #Just in case.See if this causes animation problems later though.
			pass
		"Reorganizing":
			pass
		"InPlay":
			pass
		"EnteringPlay":
			if t <= 1: #always 1 with linear interpolation
				position = start_pos.lerp(target_pos, smoother_lerp(t))
				scale = start_scale.lerp(target_scale, smoother_lerp(t))
				rotation = lerp(rotation, stored_rotation, smoother_lerp(t))
				t += delta * t_scale
			else:
				position = target_pos
				scale = target_scale
				state = "InPlay"
				t = 0
			pass
		"InInPlayFocus":
			if t <= 1: #always 1 with linear interpolation
				position = start_pos.lerp(target_pos, t)
				scale = start_scale.lerp(target_scale, t)
				t += delta * t_scale
			else:
				position = target_pos
				scale = target_scale
				t = 0
				state = "InPlayFocused"
		"InPlayFocused":
			pass
		"OutInPlayFocus":
				if t <= 1: #always 1 with linear interpolation
					position = start_pos.lerp(target_pos, smoother_lerp(t))
					scale = start_scale.lerp(target_scale, smoother_lerp(t))
					rotation = lerp(rotation, stored_rotation, smoother_lerp(t))
					t += delta * t_scale
				else:
					position = target_pos
					scale = target_scale
					t = 0
					state = "InPlay"
		"HandFocused": #Unecessary but...Whatever
			pass
		"InHandFocus":
			if t <= 1: #always 1 with linear interpolation
				position = start_pos.lerp(target_pos, t)
				scale = start_scale.lerp(target_scale, t)
				t += delta * t_scale
			else:
				position = target_pos
				scale = target_scale
				t = 0
				state = "HandFocused"

			pass
		"OutHandFocus":
				if t <= 1: #always 1 with linear interpolation
					position = start_pos.lerp(target_pos, smoother_lerp(t))
					scale = start_scale.lerp(target_scale, smoother_lerp(t))
					rotation = lerp(rotation, stored_rotation, smoother_lerp(t))
					t += delta * t_scale
				else:
					position = target_pos
					scale = target_scale
					t = 0
					state = "InHand"
		"Hidden":
			pass
		"Dragged":
				t = 0
				var vec = get_parent().get_local_mouse_position() - self.position#This is the top left corner atm.
				vec += Vector2(-self.size.x,-self.size.y)
				self.rotation = 0
				position += vec
		"Targeting":
				t = 0
				var vec = get_parent().get_local_mouse_position() - self.position#This is the top left corner atm.
				vec += Vector2(-self.size.x,-self.size.y)
				self.rotation = 0
				position += vec

	pass


func _on_mouse_entered():
	_hovered = true
	signal_self_in.emit(self)
	pass # Replace with function body.


func _on_mouse_exited():
	_hovered = false
	signal_self_out.emit(self)
	pass # Replace with function body.


