extends Node


func _ready() -> void:
	rpc_id(1, "client_ready")

remote func start(player1: Dictionary, player2: Dictionary) -> void:
	var id := get_tree().get_network_unique_id()
	
	var this_player := player1 if player1.id == id else player2
	var other_player := player1 if player1.id != id else player2
	
	print(other_player.name)
	rpc_id(1, "server_bruh")

remote func bruh() -> void:
	print("bruh")
