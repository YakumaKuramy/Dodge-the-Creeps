extends Area2D

signal hit

@export var speed: int = 400

var screen_size: Vector2

@onready var animation: AnimatedSprite2D = $animation
@onready var collision: CollisionShape2D = $collision

func _ready() -> void:
	screen_size = get_viewport_rect().size
	hide()


func _process(delta: float) -> void:
	var velocity: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		animation.play()
	else: 
		animation.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		animation.animation = "walk"
		animation.flip_h = false
		animation.flip_h = velocity.x < 0
	elif velocity.y != 0:
		animation.animation = "up"
		animation.flip_v = velocity.y > 0


func start(pos: Vector2) -> void:
	position = pos
	show()
	collision.disabled = false


func _on_body_entered(_body: Node2D) -> void:
	hide()
	hit.emit()
	collision.set_deferred("disabled", true)
