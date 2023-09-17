extends Resource
#Associated with card_resource.tres, but unknown if that's really necessary.

class_name playcard_base
@export var energy: int
@export var types: Array
@export var artimage: CompressedTexture2D
@export var description: String
@export var effect: Script
@export var card_owner: String
@export var targeting_types: Array
@export var targeting_num: int
@export var script_val_1: int
@export var script_val_2: int
#do I need num_targets, targetable, script_num?

#p for parameter
func _init(p_energy=0, p_types=[], p_artimage=preload("res://Cards/Resources/PlayerCards/Art_Images/tiger_mech.jpg"), p_description="Base description", p_effect=null, p_owner="player",
p_targeting_types = [], p_targeting_num = 1, p_script_val_1 = 1, p_script_val_2 = 2):
		energy=p_energy
		types=p_types
		artimage=p_artimage
		description=p_description
		effect=p_effect
		card_owner=p_owner
		targeting_types = p_targeting_types
		targeting_num = p_targeting_num
		script_val_1 = p_script_val_1
		script_val_2 = p_script_val_2
		
		
		
