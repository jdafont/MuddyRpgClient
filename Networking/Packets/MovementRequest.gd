extends "res://Networking/Packets/Packet.gd"

var Up
var Down
var Left
var Right

func _init():
	type = Const.PacketType.MovementRequest

func serialize():
	var buf = StreamPeerBuffer.new()
	buf.put_u32(type)
	buf.put_u8(Up)
	buf.put_u8(Down)
	buf.put_u8(Left)
	buf.put_u8(Right)
	return buf.data_array
	
func deserialize(buf):
	Up = buf.get_u8()
	Down = buf.get_u8()
	Left = buf.get_u8()
	Right = buf.get_u8()
