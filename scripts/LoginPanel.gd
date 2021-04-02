extends Panel


const pvp_mode_path := "res://scenes/PvP Mode.tscn"

onready var connect_button = $ConnectButton


func _ready() -> void:
	connect_button.connect("pressed", self, "request_token")
	
	MatchmakingServer.connect("failure", self, "token_not_received")
	MatchmakingServer.connect("success", self, "token_received")


func request_token() -> void:
	connect_button.disabled = true
	MatchmakingServer.request_token()

func token_not_received(message: String) -> void:
	print("Error: " + message)
	connect_button.disabled = false

func token_received() -> void:
	get_tree().change_scene(pvp_mode_path)
