extends Node

class_name p_effect_class

func on_played(args: Dictionary):
	print("Hello from p_effect on_play")
	pass

func on_resolve(args: Dictionary):
	print("Hello from p_effect resolve")
	pass

func on_return(args: Dictionary): #on_return is used to 'undo' the effects of on_played cards when they return to hand.
	print("Card is returned to hand.")

func on_end(args: Dictionary):
	print("Card effect resolved after both player and kaiju turns")
	pass

func deduct_energy(cost):
	var field = get_tree()
	print(field)
	#TODO: How to find any node named "playerfield" and access its energy cost...Honestly ist hat even apprpriate.
	#var node = field.get_root()
	#print (node)
	#node.avail_energy -= cost

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
