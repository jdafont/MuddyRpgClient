extends Node

var host = "127.0.0.1"
var port = 8083

const Client = preload("res://Networking/Client.gd")
const InitUserRequest = preload("res://Networking/Packets/InitUserRequest.gd")
const InitUserResponse = preload("res://Networking/Packets/InitUserResponse.gd")

var client: Client
var username: String

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
	request.Username = username
	var data = request.serialize()
	client.send(data)
	pass
func _on_disconnected():
	pass
func _on_error():
	pass
func _on_data(data: PoolByteArray):
	print("Got data! " + var2str(data))
	var buf = StreamPeerBuffer.new()
	buf.data_array = data
	var packet_id = buf.get_u32()
	if packet_id == 1:
		var packet = InitUserResponse.new()
		packet.deserialize(buf)
		print("Packet is a InitUserResponse! ObjectId is " + str(packet.ObjectId))
