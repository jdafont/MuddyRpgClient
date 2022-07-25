extends "res://Networking/Packets/Packet.gd"

var ObjectId: int = 0
func _init():
	type = Const.PacketType.InitUserResponse
	
func serialize():
	pass
	
func deserialize(buf: StreamPeerBuffer):
	var s = buf.get_u32()
	ObjectId = s
