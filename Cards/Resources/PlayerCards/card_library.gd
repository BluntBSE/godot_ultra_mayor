extends Node #Do I even need to extend Node?

var library = {
	"playcard_firefighting":{
		"energy"=1,
		"types"=["Physical", "Water"],
		"artimage"="res://Cards/Resources/PlayerCards/Art_Images/fire_mecha.jpg",
		"description"="Fight those fires",
		effect="res://Cards/Resources/PlayerCards/Card_Scripts/new_script.gd",
		card_owner="Player",
		targeting_types=["all_kaiju"],
		targeting_num=1,
		script_val_1=1,
		script_val_2=2,
	}
}
