extends Control


const pvp_mode_path := "res://scenes/PvP Mode.tscn"

onready var connect_button := $VBoxContainer/ConnectButton
onready var display_name_input := $VBoxContainer/DisplayNameInput


func _ready() -> void:
	connect_button.connect("pressed", self, "connect_to_server")
	$VBoxContainer/BackButton.connect("pressed", self, "go_back")
	
	MatchmakingServer.connect("failure", self, "display_error")
	MatchmakingServer.connect("success", self, "token_received")
	
	GameServer.connect("failure", self, "display_error")
	GameServer.connect("success", self, "join_room")


func deactivate() -> void:
	display_name_input.set_editable(false)
	connect_button.set_disabled(true)

func reactivate() -> void:
	display_name_input.set_editable(true)
	connect_button.set_disabled(false)


func connect_to_server() -> void:
	if display_name_input.get_text().empty():
		display_error("Display name cannot be empty")
		display_name_input.set_self_modulate(Color(0.93, 0.46, 0.46))
	else:
		display_name_input.set_self_modulate(Color(1, 1, 1))
		deactivate()
		MatchmakingServer.request_token()

func token_received(address: String, token: PoolByteArray) -> void:
	var display_name = display_name_input.get_text() 
	GameServer.connect_to_server(display_name, address, token)


func join_room() -> void:
	get_tree().change_scene(pvp_mode_path)
	get_tree().set_pause(false)



func display_error(message: String) -> void:
	$Error/Label.set_text("Error: " + message)
	$Error/AnimationPlayer.set_current_animation("reveal")
	$Error/AnimationPlayer.seek(0)
	reactivate()



func open_main_menu() -> void:
	get_node("../Transitions").set_current_animation("fight_to_main")

func cancel_connection() -> void:
	MatchmakingServer.cancel_connection()
	GameServer.cancel_connection()

func go_back() -> void:
	cancel_connection()
	reactivate()
	# et lille delay så man kan nå at opfatte at forbindelsen bliver afbrudt
	yield(get_tree().create_timer(0.1), "timeout")
	open_main_menu()
