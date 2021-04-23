class_name PvPMode
extends Node2D


const menu_path := "res://scenes/Menu.tscn"


func enemy_disconnected() -> void:
	get_tree().set_pause(true)
	
	var error_popup: AcceptDialog = $EnemyDisconnected
	error_popup.connect("hide", self, "exit")
	error_popup.popup_centered()

func exit() -> void:
	get_tree().change_scene(menu_path)
