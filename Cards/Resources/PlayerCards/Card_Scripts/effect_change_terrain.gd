extends p_effect_class

func on_played(args):
	print("Hello from a terrain modifying card")
	super.on_played(args)#parent super call is necessary to execute any parent code.
	pass

func on_resolve(args):
	print("Hello from firefighter resolution")
	super.on_resolve(args)
	pass

func on_return(args):
	super.on_return(args)
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
