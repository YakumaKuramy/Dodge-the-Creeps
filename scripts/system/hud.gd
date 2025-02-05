extends CanvasLayer
signal start_game

@onready var lbl_score: Label = $lbl_score
@onready var lbl_message: Label = $lbl_message
@onready var button_start: Button = $button_start
@onready var timer_message: Timer = $timer_message


func show_message(text: String) -> void:
	lbl_message.text = text
	lbl_message.show()
	timer_message.start()


func show_game_over() -> void:
	show_message("Game Over")
	await timer_message.timeout
	lbl_message.text = "Dodge the Creeps!"
	lbl_message.show()
	await get_tree().create_timer(1.0).timeout
	button_start.show()


func update_score(score: int) -> void:
	lbl_score.text = str(score)


func _on_button_start_pressed() -> void:
	button_start.hide()
	start_game.emit()


func _on_timer_message_timeout() -> void:
	lbl_message.hide()
