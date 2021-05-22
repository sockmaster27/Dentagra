extends VBoxContainer

func _ready() -> void:
	$FightButton.connect("pressed", self, "open_fight_menu")
	$ExitButton.connect("pressed", self, "exit_game")

func open_fight_menu() -> void:
	get_node("../Transitions").set_current_animation("main_to_fight")

func exit_game() -> void:
	get_tree().quit()
