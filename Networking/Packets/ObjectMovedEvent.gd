extends "res://Networking/Packets/Packet.gd"

var Position = Vector2(0, 0)
var ObjectId

func _init():
	type = Const.PacketType.ObjectMovedEvent
	
func serialize():
	pass
	
func deserialize(buf: StreamPeerBuffer):
	ObjectId = buf.get_u32()
	var x = buf.get_float()
	var y = buf.get_float()
	Position = Vector2(x, y)
