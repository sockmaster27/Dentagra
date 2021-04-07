extends Panel


const pvp_mode_path := "res://scenes/PvP Mode.tscn"

onready var connect_button = $ConnectButton


func _ready() -> void:
	connect_button.connect("pressed", self, "request_token")
	
	MatchmakingServer.connect("failure", self, "connection_error")
	MatchmakingServer.connect("success", self, "token_received")
	
	GameServer.connect("failure", self, "connection_error")
	GameServer.connect("success", self, "join_room")


func request_token() -> void:
	connect_button.disabled = true
	MatchmakingServer.request_token()

func token_received(address: String, token: PoolByteArray) -> void:
	GameServer.connect_to_server(address, token)


func join_room() -> void:
	get_tree().change_scene(pvp_mode_path)



func connection_error(message: String) -> void:
	$Error.set_text("Error: " + message)
	connect_button.disabled = false
