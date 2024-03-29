extends "res://Networking/Packets/Packet.gd"

var UpdatedPosition = Vector2(0, 0)
var Confirm = false

func _init():
	type = Const.PacketType.MovementResponse
	
func serialize():
	pass
	
func deserialize(buf: StreamPeerBuffer):
	Confirm = buf.get_u8() == 1
	var x = buf.get_float()
	var y = buf.get_float()
	UpdatedPosition = Vector2(x, y)
