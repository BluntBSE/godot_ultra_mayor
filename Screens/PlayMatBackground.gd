extends Sprite2D
var viewport_size = ProjectSettings.get_setting("display/window/size/viewport_width")
var init_width = self.texture.get_width()
var init_height = self.texture.get_height()

# Called when the node enters the scene tree for the first time.
func _ready():
	#1920/#1344
	scale.x = float(viewport_size)/float(init_width)
	scale.y = scale.x
	pass






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):#added _
	pass
