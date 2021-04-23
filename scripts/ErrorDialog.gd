class_name ErrorDialog
extends CanvasLayer


signal dismiss


func _ready() -> void:
	$Panel/Button.connect("pressed", self, "dismissed")

func set_text(text: String) -> void:
	$Panel/ErrorLabel.set_text(text)

func dismissed() -> void:
	emit_signal("dismiss")
