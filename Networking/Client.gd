extends Node

var _stream = StreamPeerTCP.new()
var _status = 0

signal connected      # Connected to server
signal data           # Received data from server
signal disconnected   # Disconnected from server
signal error          # Error with connection to server

# Called when the node enters the scene tree for the first time.
func _ready():
	_status = _stream.get_status()
	pass # Replace with function body.

func connect_to_server(host, port):
	print("Connecting to %s:%d" % [host, port])
	# Reset status so we can tell if it changes to error again.
	_status = _stream.STATUS_NONE
	var error = _stream.connect_to_host(host, port)
	if error != 0:
		print("Error connecting to host.")
		emit_signal("error")
		
func send(data: PoolByteArray) -> bool:
	if _status != _stream.STATUS_CONNECTED:
		print("Error: Stream is not currently connected.")
		return false
	var result = _stream.put_data(data)
	return result == OK
	
func _process(delta: float) -> void:
	var new_status: int = _stream.get_status()
	if new_status != _status:
		_status = new_status
		match _status:
			_stream.STATUS_NONE:
				print("Disconnected from host.")
				emit_signal("disconnected")
			_stream.STATUS_CONNECTING:
				print("Connecting to host.")
			_stream.STATUS_CONNECTED:
				print("Connected to host.")
				emit_signal("connected")
			_stream.STATUS_ERROR:
				print("Error with socket stream.")
				emit_signal("error")

	if _status == _stream.STATUS_CONNECTED:
		var available_bytes: int = _stream.get_available_bytes()
		if available_bytes > 0:
			print("available bytes: ", available_bytes)
			var data: String = _stream.get_utf8_string()
			emit_signal("data", data)
