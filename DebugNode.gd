extends Node


const InitUserRequest = preload("res://Networking/Packets/InitUserRequest.gd")
func _ready():
	var x = InitUserRequest.new()
	x.Username = "Alexi"
	var result = x.serialize()
	var y = InitUserRequest.new()
	y.deserialize(result)
	var name = y.Username
	pass
