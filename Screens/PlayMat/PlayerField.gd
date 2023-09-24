extends Node2D
var cards_in_play = [] #array of cards in play
var drag_target = true
#An array of anonymous dictionaries that look like

#{"origin":<cardNode> "targets":[node,node]}
var p_action_queue = []
var k_action_queue = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
