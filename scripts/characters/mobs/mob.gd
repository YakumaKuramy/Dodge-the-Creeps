extends RigidBody2D

@onready var animation: AnimatedSprite2D = $animation
@onready var collision: CollisionShape2D = $collision


func _ready() -> void:
	var mob_types: PackedStringArray = animation.sprite_frames.get_animation_names()
	animation.play(mob_types[randi() % mob_types.size()])


func _on_notifier_screen_exited() -> void:
	queue_free() 
