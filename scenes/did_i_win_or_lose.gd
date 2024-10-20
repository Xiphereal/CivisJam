extends Button

const WIN_SCREEN = preload("res://art/Win.png")
const GAME_OVER_SCREEN = preload("res://art/GameOver.png")

var timeout = false

func win():
	icon = WIN_SCREEN
	_display()

func lose():
	icon = GAME_OVER_SCREEN
	_display() 
	
func _display():
	visible = true
	%GameOverWait.start()

func _on_pressed() -> void:
	if timeout:
		get_tree().change_scene_to_file("res://scenes/instructions2.tscn")
	#get_tree().reload_current_scene()


func _on_game_over_wait_timeout():
	timeout = true
