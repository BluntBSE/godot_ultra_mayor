extends card_class

func on_played():
	print("Hello from Firefighter")
	super.on_played()#parent super call is necessary to execute any parent code.
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	print("You called new_script.gd!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
