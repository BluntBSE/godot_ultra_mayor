extends p_effect_class

func on_played():
	print("Hello from Firefighter on_play")
	super.on_played()#parent super call is necessary to execute any parent code.
	pass

func on_resolve():
	print("Hello from firefighter resolution")
	super.on_resolve()
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
