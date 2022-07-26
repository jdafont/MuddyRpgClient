extends Node

var host = "127.0.0.1"
var port = 8083

const Client = preload("res://Networking/Client.gd")
const PacketFrame = preload("res://Networking/Packets/PacketFrame.gd")
const InitUserRequest = preload("res://Networking/Packets/InitUserRequest.gd")

var client: Client
var username: String

signal player_init(username, object_id)
signal packet_received(packet)
signal disconnected

func _ready():
	client = Client.new()
	client.connect("data", self, "_on_data")
	client.connect("connected", self, "_on_connected")
	client.connect("disconnected", self, "_on_disconnected")
	client.connect("error", self, "_on_error")
	
func _process(delta):
	if client:
		client._process(delta)

func _connect_to_server(username):
	self.username = username
	client.connect_to_server(host, port)
	
func _on_connected():
	var request = InitUserRequest.new()
	request.Username = self.username
	var data = request.serialize()
	client.send(data)
	pass
	
func _on_disconnected():
	emit_signal("disconnected")
	pass
	
func _on_error():
	pass
	
func _on_data(data: PoolByteArray):
	var buf = StreamPeerBuffer.new()
	buf.data_array = data
	while buf.get_available_bytes() > 0:
		var frame = PacketFrame.new()
		var packet = frame.deserialize_packet(buf)
		
		if packet.type == Const.PacketType.InitUserResponse:
			emit_signal("player_init", self.username, packet.ObjectId)
		else:
			emit_signal("packet_received", packet)

func send_packet(packet):
	var data = packet.serialize()
	client.send(data)
