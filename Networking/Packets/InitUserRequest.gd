extends Node

var Username: String = "Alex"

func serialize():
	var buf = StreamPeerBuffer.new()
	buf.put_utf8_string(Username)
	return buf.data_array
	
func deserialize(bytes):
	var result = StreamPeerBuffer.new()
	result.data_array = bytes
	var s = result.get_utf8_string()
	Username = s
