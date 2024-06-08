extends Node

var players = []

func _ready():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(12345)  # Port number
	get_tree().network_peer = peer
	print("Server started on port 12345")
	peer.connect("peer_connected", self, "_on_network_peer_connected")
	peer.connect("peer_disconnected", self, "_on_network_peer_disconnected")
func _on_player_connected(id):
	print("Player connected: ", id)
	players.append(id)

func _on_player_disconnected(id):
	print("Player disconnected: ", id)
	players.erase(id)

func _on_network_peer_connected(id):
	print("New player connected: ", id)
	rpc_id(id, "setup_player", "some_initial_data")

func _on_network_peer_disconnected(id):
	print("Player disconnected: ", id)
	players.erase(id)
