extends Button
@export var _deck_list: String

	
#Probably need an unpacking function where the data is parsed to the card.
func print_me():
	print("You called print_me")
	
func spawn_card():
	print(DeckList.deck_list)
	var card_to_spawn = DeckList.deck_list[_deck_list].front()
	print("Spawning card!")
	var root_node = get_tree().get_root()
	var spawned_card =  preload("res://Cards/playcard_template.tscn").instantiate().init(card_to_spawn)
	print(spawned_card)
	root_node.add_child(spawned_card)
	return spawned_card
# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(self._button_pressed)
	print("Good morning from ready")
	pass

	#root_node.add_child.call_deferred(spawned_card) #This is adding it to the


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta): #prefixed delted with _ since it's not used. unprefix if used.
	pass
	
func _button_pressed():
	print("Button pressed")
	var root_node = get_tree().get_root()
	print_me()
	var new_card = spawn_card()
	#root_node.remove_child(new_card)
	#self.add_child(new_card) #assign to hand node. 
	new_card.position = self.position + (Vector2(100,0))
