extends "res://Networking/Packets/Packet.gd"

var ObjectId: int = 0
func _init():
	type = Const.PacketType.InitUserResponse
	
func serialize():
	pass
	
func deserialize(buf: StreamPeerBuffer):
	ObjectId = buf.get_u32()
