extends CharacterBody3D

#export variables that can be modified in properties
#in degrees
@export var max_steer_angle:float = 3.0
@export var accel_decel_const:float = 1.0
@export var steer_change_speed:float = .50
@export var target_speed_change:float = 2.0
@export var max_min_targ_speed:float = 3.0

var steer_angle:float
var heading:Vector3 = Vector3(0,0,1)
var target_speed:float = 0.0
var curr_speed: float = 0.0

func _physics_process(delta: float) -> void:
	#increase/decrease target speed based on player input of "w" and "a"
	if Input.is_action_pressed("forward"):
		target_speed = min(target_speed + (target_speed_change * delta), max_min_targ_speed)
	elif Input.is_action_pressed("backward"):
		target_speed = max(target_speed - (target_speed_change * delta), -max_min_targ_speed)
		
	#accels/decels to reach target speed
	if target_speed > curr_speed:
		curr_speed = min(curr_speed + (accel_decel_const * delta), target_speed)
	elif target_speed < curr_speed:
		curr_speed = max(curr_speed - (accel_decel_const * delta), target_speed)
		
	#basic velocity calc
	velocity = heading * curr_speed
	
	move_and_slide()
