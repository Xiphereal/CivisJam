extends Timer

@export var min_time = 1
@export var max_time = 4

@export var min_force = 10
@export var max_force = 30

func _on_timeout() -> void:
	%Key.boss_pull(randi_range(min_force, max_force))
	change_timer_randomly()
	
func change_timer_randomly():
	wait_time = randi_range(min_time, max_time)
