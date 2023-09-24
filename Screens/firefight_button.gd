extends Button

var card_library = preload("res://Cards/Resources/PlayerCards/card_library.gd")
func assdrawdign_card(card,cardid): #This should belong to the card prototype for sure instead of being here.
	#Probably hit it with call or callv.



	pass
#Probably need an unpacking function where the data is parsed to the card.


func spawn_card():
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	var root_node = get_tree().get_root()
	print(root_node)
	var spawned_card = preload("res://Cards/playcard_template.tscn").instantiate().init()
	#root_node.add_child.call_deferred(spawned_card) #This is adding it to the


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta): #prefixed delted with _ since it's not used. unprefix if used.
	pass

func _button_pressed():

	spawn_card()
