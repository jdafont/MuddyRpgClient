extends Node

var username
var player_id

var networkManager

const Mobile = preload("res://Mobile.tscn")

signal send_packet(packet)

func _on_packet(packet):
	match packet.type:
		Const.PacketType.MovementResponse:
			$Player.position = packet.UpdatedPosition
		Const.PacketType.NewObjectEvent:
			var player = Mobile.instance()
			player.playerName = packet.Name
			player.position = packet.Position
			player.objectId = packet.ObjectId
			player.name = "Object_" + str(packet.ObjectId)
			add_child(player)
		Const.PacketType.ObjectMovedEvent:
			var obj = get_node("Object_" + str(packet.ObjectId))
			if obj != null:
				obj.position = packet.Position
		Const.PacketType.ObjectRemovedEvent:
			var obj = get_node("Object_" + str(packet.ObjectId))
			if obj != null:
				obj.queue_free()
	pass

func send_packet(packet):
	networkManager.send_packet(packet)
