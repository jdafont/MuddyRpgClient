extends Object

const InitUserRequest = preload("res://Networking/Packets/InitUserRequest.gd")
const InitUserResponse = preload("res://Networking/Packets/InitUserResponse.gd")
const MovementRequest = preload("res://Networking/Packets/MovementRequest.gd")
const MovementResponse = preload("res://Networking/Packets/MovementResponse.gd")
const NewObjectEvent = preload("res://Networking/Packets/NewObjectEvent.gd")
const ObjectMovedEvent = preload("res://Networking/Packets/ObjectMovedEvent.gd")
const ObjectRemovedEvent = preload("res://Networking/Packets/ObjectRemovedEvent.gd")


func deserialize_packet(buf: StreamPeerBuffer):
	var packet_id = buf.get_u32()
	
	match packet_id:
		Const.PacketType.InitUserRequest:
			var p = InitUserRequest.new()
			p.deserialize(buf)
			return p
		Const.PacketType.InitUserResponse:
			var p = InitUserResponse.new()
			p.deserialize(buf)
			return p
		Const.PacketType.MovementRequest:
			var p = MovementRequest.new()
			p.deserialize(buf)
			return p
		Const.PacketType.MovementResponse:
			var p = MovementResponse.new()
			p.deserialize(buf)
			return p
		Const.PacketType.NewObjectEvent:
			var p = NewObjectEvent.new()
			p.deserialize(buf)
			return p
		Const.PacketType.ObjectMovedEvent:
			var p = ObjectMovedEvent.new()
			p.deserialize(buf)
			return p
		Const.PacketType.ObjectRemovedEvent:
			var p = ObjectRemovedEvent.new()
			p.deserialize(buf)
			return p
