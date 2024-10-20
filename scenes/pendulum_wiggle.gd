extends Node2D

var pivot_point	 
var end_position : Vector2 	#pendulum itself
var arm_length:float
var angle	#Get angle between position + add godot angle offset

@export var gravity = 0.4 * 60
@export var damping = 0.995 #Arbitrary dampening force

var angular_velocity = 0.0
var angular_acceleration = 0.0

func _ready()->void:
	_set_start_position(global_position, $Marker2D.position)

func _set_start_position(start_pos:Vector2, end_pos:Vector2):
	pivot_point = start_pos
	end_position = end_pos
	arm_length = Vector2.ZERO.distance_to(end_position-pivot_point)
	angle = Vector2.ZERO.angle_to(end_position-pivot_point) - deg_to_rad(-90)
	angular_velocity = 0.0
	angular_acceleration = 0.0

func process_velocity(delta:float)->void:
	angular_acceleration = ((-gravity*delta) / arm_length) *sin(angle)	#Calculate acceleration (see: http://www.myphysicslab.com/pendulum1.html)
	angular_velocity += angular_acceleration				#Increment velocity
	angular_velocity *= damping								#Arbitrary damping
	angle += angular_velocity								#Increment angle
	
	end_position = pivot_point + Vector2(arm_length*sin(angle), arm_length*cos(angle))

func add_angular_velocity(force:float)->void:
	angular_velocity += force

func _physics_process(delta)->void:
	process_velocity(delta)
	
	if randi_range(1, 4) == 1:
		add_angular_velocity([-1, 1].pick_random() * 0.002)
	
	rotation = angle
