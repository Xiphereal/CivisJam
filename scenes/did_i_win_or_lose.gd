extends Button

const WIN_SCREEN = preload("res://art/Win.png")
const GAME_OVER_SCREEN = preload("res://art/GameOver.png")

@onready var enable_input_after: Timer = $EnableInputAfter

func win():
	icon = WIN_SCREEN
	_display()

func lose():
	icon = GAME_OVER_SCREEN
	_display() 
	
func _display():
	visible = true
	enable_input_after.start()

func _on_pressed() -> void:
	get_tree().reload_current_scene()

func _enable_input_after_timeout() -> void:
	disabled = false
