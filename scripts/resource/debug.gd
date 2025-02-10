extends Control

var screen_size: Vector2

@onready var label: Label = $label

func _ready() -> void:
	screen_size = get_viewport().size
	var max_size = DisplayServer.screen_get_size()
	get_tree().root.size = max_size
	label.text = str("Tamanho atual da tela: ", max_size, "\n", "FPS: ", str(Engine.get_frames_per_second()))
