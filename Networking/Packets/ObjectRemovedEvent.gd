extends "res://Networking/Packets/Packet.gd"

var ObjectId

func _init():
	type = Const.PacketType.ObjectRemovedEvent
	
func serialize():
	pass
	
func deserialize(buf: StreamPeerBuffer):
	ObjectId = buf.get_u32()
