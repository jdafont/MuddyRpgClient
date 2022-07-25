extends "res://Networking/Packets/Packet.gd"

var Position = Vector2(0, 0)

func _init():
	type = Const.PacketType.MovementRequest

func serialize():
	var buf = StreamPeerBuffer.new()
	buf.put_f32(Position.x)
	buf.put_f32(Position.y)
	return buf.data_array
	
func deserialize(bytes):
	var result = StreamPeerBuffer.new()
	result.data_array = bytes
	var x = result.get_f32()
	var y = result.get_f32()
	Position = Vector2(x, y)
