extends "res://Networking/Packets/Packet.gd"

var UpdatedPosition = Vector2(0, 0)
var Confirm = false

func _init():
	type = Const.PacketType.MovementResponse
	
func serialize():
	pass
	
func deserialize(bytes):
	var result = StreamPeerBuffer.new()
	result.data_array = bytes
	Confirm = result.get_u8() == 1
	var x = result.get_f32()
	var y = result.get_f32()
	UpdatedPosition = Vector2(x, y)
