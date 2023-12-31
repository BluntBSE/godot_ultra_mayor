extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(self._button_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _button_pressed():
		print("Hello world, Im redrawing the hand")
		var parent =get_parent()
		var hand = parent.get_node("PlayerHand")
		print(hand.cih)
		hand.refresh_hand()
	
