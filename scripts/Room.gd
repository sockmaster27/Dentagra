extends Node


func _ready() -> void:
	rpc_id(1, "client_ready")

remote func start() -> void:
	print(get_path())
	rpc_id(1, "server_bruh")

remote func bruh() -> void:
	print("bruh")
