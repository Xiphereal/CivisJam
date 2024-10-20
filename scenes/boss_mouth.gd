extends TextureRect

const BOCADILLO_1 = preload("res://art/bocadillo1.png")
const BOCADILLO_2 = preload("res://art/bocadillo2.png")

func _on_boss_exhaust_timeout():
	texture = BOCADILLO_2
	$AnimationPlayer.play("fade")
	
func _say_got_ya():
	texture = BOCADILLO_1
	$AnimationPlayer.play("fade")
