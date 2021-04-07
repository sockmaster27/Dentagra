extends Node

signal success()
signal failure(message)


export var gamer_server_port := 2090

var client := NetworkedMultiplayerENet.new()

const Room := preload("res://scripts/Room.gd")
var room_node: Room


func connect_to_server(address: String, token: PoolByteArray) -> void:
	client.connect("connection_succeeded", self, "request_room", [token])
	client.connect("connection_failed", self, "connection_failed")
	client.connect("server_disconnected", self, "connection_closed")
	
	var error := client.create_client(address, gamer_server_port)
	if error != OK:
		emit_signal("failure", "Cannot create connection to game server.")
	else:
		get_tree().set_network_peer(client)

func request_room(token: PoolByteArray) -> void:
	rpc("receive_token", token)

remote func join_room(room_name: String) -> void:
	room_node = Room.new()
	room_node.set_name(room_name)
	add_child(room_node)
	emit_signal("success")


func connection_failed() -> void:
	emit_signal("failure", "Cannot connect to game server.")
	print("Cannot connect to game server.")

func connection_closed() -> void:
	emit_signal("failure", "Game server disconnected.")
	print("Game server disconnected.")
