extends Node

@export var mob_scene: PackedScene

@onready var player: Area2D = $player
@onready var start_position: Marker2D = $start_position

@onready var mob_timer: Timer = $timers/mob_timer
@onready var score_timer: Timer = $timers/score_timer
@onready var start_timer: Timer = $timers/start_timer

@onready var path_follow: PathFollow2D = $path_spawn_mobs/path_follow

var score: int = 0

func _ready() -> void:
	new_game()


func new_game() -> void:
	score = 0
	player.start(start_position.position)
	start_timer.start()


func game_over() -> void:
	score_timer.stop()
	mob_timer.stop()


func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	var mob_spawn_location = path_follow
	mob_spawn_location.progress_ratio = randf()
	var direction = mob_spawn_location.rotation + PI / 2
	mob.position = mob_spawn_location.position
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	add_child(mob)


func _on_score_timer_timeout() -> void:
	score += 1


func _on_start_timer_timeout() -> void:
	mob_timer.start()
	score_timer.start()
