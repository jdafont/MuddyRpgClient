extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var MainMenu = preload("res://MainMenu/ConnectPrompt.tscn")
var GameWorld = preload("res://GameWorld/GameWorld.tscn")
var networkManager

var current_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	self.networkManager = $"/root/NetworkManager"
	
	self.networkManager.connect("player_init", self, "_on_player_init")
	self.networkManager.connect("disconnected", self, "_on_disconnect")
	
	var menu = MainMenu.instance()
	add_child(menu)
	self.current_scene = menu

func _on_player_init(username, object_id):
	print("Player init! " + username + " " + str(object_id))
	current_scene.queue_free()
	current_scene = GameWorld.instance()
	current_scene.username = username
	current_scene.player_id = object_id
	current_scene.networkManager = self.networkManager
	add_child(current_scene)
	self.networkManager.connect("packet_received", current_scene, "_on_packet")

func _on_disconnect():
	current_scene.queue_free()
	current_scene = MainMenu.instance()
	add_child(current_scene)
	pass
