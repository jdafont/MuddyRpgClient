extends Object

var InitUserRequest = preload("res://Networking/Packets/InitUserRequest.gd")
var InitUserResponse = preload("res://Networking/Packets/InitUserResponse.gd")
var MovementRequest = preload("res://Networking/Packets/MovementRequest.gd")
var MovementResponse = preload("res://Networking/Packets/MovementResponse.gd")


func deserialize_packet(data):
	var buf = StreamPeerBuffer.new()
	buf.data_array = data
	var packet_id = buf.get_u32()
	
	match packet_id:
		Const.PacketType.InitUserRequest:
			var p = InitUserRequest.new()
			p.type = packet_id
			p.deserialize(buf)
			return p
		Const.PacketType.InitUserResponse:
			var p = InitUserResponse.new()
			p.type = packet_id
			p.deserialize(buf)
			return p
		Const.PacketType.MovementRequest:
			var p = MovementRequest.new()
			p.type = packet_id
			p.deserialize(buf)
			return p
		Const.PacketType.MovementResponse:
			var p = MovementResponse.new()
			p.type = packet_id
			p.deserialize(buf)
			return p
