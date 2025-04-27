extends Path2D

@onready var line: Line2D = $line

func _ready() -> void:
	get_viewport().connect("size_changed", _on_viewport_resized)
	_on_viewport_resized()


func _on_viewport_resized() -> void:
	var screen_size = get_viewport().get_visible_rect().size
	var curve = Curve2D.new()
	curve.add_point(Vector2(0, screen_size.y / 2))
	curve.add_point(Vector2(screen_size.x, screen_size.y / 2))
	self.curve = curve
	print(screen_size)
