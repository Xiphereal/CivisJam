extends Button

const WIN_SCREEN = preload("res://art/Win.png")
const GAME_OVER_SCREEN = preload("res://art/GameOver.png")

func win():
	icon = WIN_SCREEN
	visible = true

func lose():
	icon = GAME_OVER_SCREEN
	visible = true

func _on_pressed() -> void:
	get_tree().reload_current_scene()
