extends Node

func connect_to_server(ip):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip, 12345)  # IP address and port number
	get_tree().network_peer = peer
	print("Connecting to server at ", ip)

func _on_connected_to_server():
	print("Connected to server")

func _on_disconnected_from_server():
	print("Disconnected from server")

func _ready():
	get_tree().connect("connected_to_server", self, "_on_connected_to_server")
	get_tree().connect("server_disconnected", self, "_on_disconnected_from_server")
