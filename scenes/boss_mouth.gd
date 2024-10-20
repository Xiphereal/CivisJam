extends TextureRect

const BOCADILLO_2 = preload("res://art/bocadillo2.png")

func _on_boss_exhaust_timeout():
	texture = BOCADILLO_2
