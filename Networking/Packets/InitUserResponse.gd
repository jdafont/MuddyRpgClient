extends Node

var ObjectId: int = 0

func serialize():
	pass
	
func deserialize(buf: StreamPeerBuffer):
	var s = buf.get_u32()
	ObjectId = s
