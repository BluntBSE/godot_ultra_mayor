extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var energy = %PlayerField.avail_energy
	var f_string = "Available energy %s"
	text = f_string % energy
	pass
