extends "res://Networking/Packets/Packet.gd"

var Position = Vector2(0, 0)
var ObjectId
var Name

func _init():
	type = Const.PacketType.NewObjectEvent
	
func serialize():
	pass
	
func deserialize(buf: StreamPeerBuffer):
	ObjectId = buf.get_u32()
	var x = buf.get_float()
	var y = buf.get_float()
	Name = buf.get_utf8_string()
	Position = Vector2(x, y)
