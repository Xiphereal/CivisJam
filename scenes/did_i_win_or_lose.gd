extends Button

const WIN_SCREEN = preload("res://art/Win.png")
const GAME_OVER_SCREEN = preload("res://art/GameOver.png")

func win():
	icon = WIN_SCREEN
	_display()

func lose():
	icon = GAME_OVER_SCREEN
	_display() 
	
func _display():
	visible = true

func _on_pressed() -> void:
	await get_tree().create_timer(1.5).timeout
	get_tree().reload_current_scene()
