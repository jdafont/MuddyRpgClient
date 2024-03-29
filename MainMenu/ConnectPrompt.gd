extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal connect_to_server(username)

var enable_connect = true

# Called when the node enters the scene tree for the first time.
func _ready():
	var networkManager = $"/root/NetworkManager"
	connect("connect_to_server", networkManager, "_connect_to_server")
	pass # Replace with function body.

func _on_Connect_pressed():
	enable_connect = false
	var button = $VBoxContainer/CenterContainer/VBoxContainer/Connect
	button.disabled = !enable_connect
	var username = $VBoxContainer/CenterContainer/VBoxContainer/HBoxContainer/Username
	emit_signal("connect_to_server", username.text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enable_connect:
		var button = $VBoxContainer/CenterContainer/VBoxContainer/Connect
		button.disabled = !enable_connect
	pass
