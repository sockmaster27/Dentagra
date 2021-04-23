extends Panel


const pvp_mode_path := "res://scenes/PvP Mode.tscn"

onready var connect_button = $ConnectButton


func _ready() -> void:
	connect_button.connect("pressed", self, "connect_to_server")
	
	MatchmakingServer.connect("failure", self, "display_error")
	MatchmakingServer.connect("success", self, "token_received")
	
	GameServer.connect("failure", self, "display_error")
	GameServer.connect("success", self, "join_room")


func connect_to_server() -> void:
	if $DisplayNameInput.get_text().empty():
		display_error("Display name cannot be empty")
	else:
		$DisplayNameInput.set_editable(false)
		connect_button.set_disabled(true)
		MatchmakingServer.request_token()

func token_received(address: String, token: PoolByteArray) -> void:
	var display_name = $DisplayNameInput.get_text() 
	GameServer.connect_to_server(display_name, address, token)


func join_room() -> void:
	get_tree().change_scene(pvp_mode_path)
	get_tree().set_pause(false)



func display_error(message: String) -> void:
	$Error.set_text("Error: " + message)
	$DisplayNameInput.set_editable(true)
	connect_button.set_disabled(false)
