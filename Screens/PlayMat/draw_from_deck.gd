extends Button
@export var _deck_list: String
signal draw_source(card_id, origin)
var rng = RandomNumberGenerator.new()
var deck


#Probably need an unpacking function where the data is parsed to the car


# Called when the node enters the scene tree for the first time.
func _ready():

	deck = DeckList.deck_list[_deck_list]
	#Cheap placeholder shuffle -- This does not guarantee uniformity. Go look that one up later.
	rng.randomize()
	var deck_size = deck.size()
	for i in deck_size:
		var random = rng.randi_range(0,deck_size-1)
		var tmp = deck[i]
		deck[i] = deck[random]
		deck[random] = tmp

	pressed.connect(self._button_pressed)
	pass

	#root_node.add_child.call_deferred(spawned_card) #This is adding it to the


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta): #prefixed delted with _ since it's not used. unprefix if used.
	pass

func _button_pressed():
	if deck.size() > 0:
		var card_to_spawn = deck.pop_front()
		print(deck)
		draw_source.emit(card_to_spawn, self) #Emit the card sent from this deck, along with the deck node itself


