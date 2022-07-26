extends Node2D

const MovementRequest = preload("res://Networking/Packets/MovementRequest.gd")

var speed = 200
var playerName = "Untitled"
var objectId = 0

var world

func _ready():
	world = get_parent()
	playerName = world.username
	objectId = world.player_id

func _process(delta):
	pass

func _physics_process(delta):
	var movementRequest = MovementRequest.new()
	movementRequest.Right = Input.is_action_pressed("move_right")
	movementRequest.Left = Input.is_action_pressed("move_left")
	movementRequest.Up = Input.is_action_pressed("move_up")
	movementRequest.Down = Input.is_action_pressed("move_down")
	
	world.send_packet(movementRequest)
