extends "res://Networking/Packets/Packet.gd"

var Username: String = "Alex"
func _init():
	type = Const.PacketType.InitUserRequest
	
func serialize():
	var buf = StreamPeerBuffer.new()
	buf.put_u32(type)
	buf.put_utf8_string(Username)
	return buf.data_array
	
func deserialize(buf: StreamPeerBuffer):
	Username = buf.get_utf8_string()
