extends ProgressBar

func _ready() -> void:
	max_value = %BossExhaust.wait_time
	
func _process(delta: float) -> void:
	value = max(%BossExhaust.time_left, %BossExhaust.wait_time * 0.075)
