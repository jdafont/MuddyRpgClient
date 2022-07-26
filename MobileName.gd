extends Label

func _ready():
	var mobile = get_parent()
	text = mobile.playerName + " (" + str(mobile.objectId) + ")"
	pass
