extends Camera2D

## How quickly the shaking stops [0, 1].
@export var decay = 0.8  

## Maximum hor/ver shake in pixels.
@export var max_offset = Vector2(100, 75) 

## Maximum rotation in radians (use sparingly).
@export var max_roll = 0.1  

var trauma = 0.0  # Current shake strength.
var trauma_power = 2  # Trauma exponent. Use [2, 3].

func _process(delta) -> void:
	shake(delta)

func initiate_shake(amount):
	assert(amount <= 1)
	trauma = min(trauma + amount, 1.0)
	
func shake(delta):
	trauma = max(trauma - decay * delta, 0)
	
	var amount = pow(trauma, trauma_power)
	rotation = max_roll * amount * randf_range(-1, 1)
	offset.x = max_offset.x * amount * randf_range(-1, 1)
	offset.y = max_offset.y * amount * randf_range(-1, 1)
