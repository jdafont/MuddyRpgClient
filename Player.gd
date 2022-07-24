extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var accel = Vector2(0.0, 0.0)
	if Input.is_action_pressed("move_right"):
		# Move as long as the key/button is pressed.
		accel.x = 1
	if Input.is_action_pressed("move_left"):
		# Move as long as the key/button is pressed.
		accel.x = -1
	if Input.is_action_pressed("move_up"):
		# Move as long as the key/button is pressed.
		accel.y = -1
	if Input.is_action_pressed("move_down"):
		accel.y = 1
	
	if accel.length() != 0:
		accel = accel.normalized() * speed
		position += accel * delta
