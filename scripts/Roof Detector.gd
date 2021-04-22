extends Area2D


func _ready() -> void:
	connect("body_entered", self, "roof_entered")
	connect("body_exited", self, "roof_exited")

func roof_entered(roof_node: Roof) -> void:
	roof_node.fade_out()

func roof_exited(roof_node: Roof) -> void:
	roof_node.fade_in()
