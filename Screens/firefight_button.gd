extends Button



#Probably need an unpacking function where the data is parsed to the card.
func print_me():
	print("You called print_me")
	
func spawn_card():
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	var root_node = get_tree().get_root()
	print(root_node)
	#self.pressed.connect(self._button_pressed)
	#var spawned_card = preload("res://Cards/playcard_template.tscn").instantiate()
	#root_node.add_child.call_deferred(spawned_card) #This is adding it to the


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta): #prefixed delted with _ since it's not used. unprefix if used.
	pass
	
func _button_pressed():
	print_me()
	spawn_card()
