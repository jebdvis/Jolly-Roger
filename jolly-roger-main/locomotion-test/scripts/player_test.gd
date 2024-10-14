extends CharacterBody3D

#export variables that can be modified in properties
#in degrees
@export var max_steer_angle:float = 30
@export var accel_decel_const:float = 1.0
@export var steer_change_speed:float = .50
@export var target_speed_change:float = 2.0
@export var max_targ_speed:float = 3.0
@export var min_targ_speed:float = -.3

var steer_angle:float = 0.0
var heading:Vector3 = Vector3(0,0,1)
var target_speed:float = 0.0
var curr_speed: float = 0.0

func _physics_process(delta: float) -> void:
	#increase/decrease target speed based on player input of "w" and "s"
	if Input.is_action_pressed("forward"):
		target_speed = min(target_speed + (target_speed_change * delta), max_targ_speed)
	elif Input.is_action_pressed("backward"):
		target_speed = max(target_speed - (target_speed_change * delta), min_targ_speed)
		
	#changes steer angle based on if "a" or "d" is pressed
	if Input.is_action_pressed("left"):
		steer_angle = min(steer_angle + (steer_change_speed * delta), max_steer_angle)
	elif Input.is_action_pressed("right"):
		steer_angle = max(steer_angle - (steer_change_speed * delta), -max_steer_angle)
	steer_angle = clamp(steer_angle, -max_steer_angle, max_steer_angle)
	heading = heading.rotated(Vector3.UP, deg_to_rad(steer_angle * (curr_speed / max_targ_speed)))
		
	#accels/decels to reach target speed
	if target_speed > curr_speed:
		curr_speed = min(curr_speed + (accel_decel_const * delta), target_speed)
	elif target_speed < curr_speed:
		curr_speed = max(curr_speed - (accel_decel_const * delta), target_speed)
		
	
	
	#basic velocity calc
	velocity = heading * curr_speed
	if velocity.length() > .01:
		var target_pos = get_global_transform().origin + heading * 10
		look_at(target_pos, Vector3.UP, true)
	move_and_slide()
	
