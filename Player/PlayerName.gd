extends Label

func _ready():
	var gameworld = get_parent().get_parent()
	text = gameworld.username + " (" + str(gameworld.player_id) + ")"
	pass
